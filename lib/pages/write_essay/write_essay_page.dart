import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_event.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_state.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/pages/write_essay/widgets/write_essay_category_button.dart';
import 'package:unknown_note_flutter/pages/write_essay/widgets/write_essay_category_slide_widget.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_draggable.dart';
import 'package:unknown_note_flutter/widgets/common_horizontal_spliter.dart';
import 'package:unknown_note_flutter/widgets/common_loading_widget.dart';
import 'package:unknown_note_flutter/widgets/common_snackbar.dart';
import 'package:unknown_note_flutter/widgets/common_text_form.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';
import 'package:unknown_note_flutter/widgets/common_write_slide_widget.dart';

class WriteEssayPage extends StatefulWidget {
  final EssayModel? essay;

  const WriteEssayPage({
    super.key,
    this.essay,
  });

  @override
  State<WriteEssayPage> createState() => _WriteEssayPageState();
}

class _WriteEssayPageState extends State<WriteEssayPage> {
  late ValueNotifier<EssayModel> _essay;

  @override
  void initState() {
    super.initState();
    _essay = ValueNotifier<EssayModel>(widget.essay ??
        EssayModel(
          time: DateTime.now(),
        ));
  }

  bool _isUploading(WriteEssayState state) {
    return state.status == EUploadStatus.tagging ||
        state.status == EUploadStatus.uploading;
  }

  void _onSettingTap() {
    DraggableMenu.open(
      context,
      CommonDraggable(
        child: CommonWriteSlideWidget(
          onDelete: _onDelete,
        ),
      ),
    );
  }

  void _onCategoryTap() {
    DraggableMenu.open(
      context,
      CommonDraggable(
        child: ValueListenableBuilder(
          valueListenable: _essay,
          builder: (context, value, _) {
            return WriteEssayCategorySlideWidget(
              selected: value.category,
              onSelected: _onCategorySelect,
            );
          },
        ),
      ),
    );
  }

  void _onCategorySelect(EEssayCategory category) {
    _essay.value = _essay.value.copyWith(category: category);
  }

  void _onTitleChanged(String value) {
    _essay.value = _essay.value.copyWith(title: value);
  }

  void _onBodyChanged(String value) {
    _essay.value = _essay.value.copyWith(content: value);
  }

  void _onDelete() {
    setState(() {
      _essay.value = EssayModel(
        time: DateTime.now(),
      );
    });
  }

  void _upload() {
    context.read<WriteEssayBloc>().add(WriteEssayUpload(_essay.value));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WriteEssayBloc, WriteEssayState>(
      listener: (context, state) {
        if (state.status == EUploadStatus.success) {
          context.replace(
            '/essay/${_essay.value.id}',
            extra: _essay.value,
          );
        }
        if (state.status == EUploadStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            CommonSnackbar(
              context,
              content: AppFont(state.message ?? '일기 저장에 실패했습니다.'),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const AppFont(
            '수필 작성',
            size: Sizes.size16,
          ),
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
          foregroundColor: Colors.white,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _isUploading(state) ? null : _onSettingTap,
              icon: const Icon(Icons.settings_rounded),
            ),
            IconButton(
              onPressed: _isUploading(state) ? null : _upload,
              icon: const Icon(Icons.save_rounded),
            ),
          ],
        ),
        body: Stack(
          children: [
            _buildBody(),
            if (_isUploading(state))
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CommonLoadingWidget(),
                      Gaps.v5,
                      AppFont(
                        state.status.text,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(
        top: Sizes.size20,
        left: Sizes.size20,
        right: Sizes.size20,
        bottom: Sizes.size60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable: _essay,
                builder: (context, value, child) {
                  return WriteEssayCategoryButton(
                    onTap: _onCategoryTap,
                    category: value.category,
                  );
                },
              ),
              Gaps.h10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppFont(
                      '제목',
                      color: Theme.of(context).primaryColor,
                    ),
                    const CommonHorizontalSpliter(),
                    Container(
                      color: Theme.of(context).primaryColor.withOpacity(0.05),
                      padding:
                          const EdgeInsets.symmetric(horizontal: Sizes.size10),
                      child: SingleChildScrollView(
                        child: CommonTextForm(
                          initText: _essay.value.title,
                          getValue: _onTitleChanged,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Gaps.v10,
          AppFont(
            '내용',
            color: Theme.of(context).primaryColor,
          ),
          const CommonHorizontalSpliter(),
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor.withOpacity(0.05),
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
              child: CommonTextForm(
                initText: _essay.value.content,
                getValue: _onBodyChanged,
                singleLine: false,
                expanded: true,
                dynamicSize: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
