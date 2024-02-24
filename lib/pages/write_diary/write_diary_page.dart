import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_state.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/pages/diary/widgets/diary_emotion_widget.dart';
import 'package:unknown_note_flutter/pages/write_diary/widgets/write_diary_emotion_button.dart';
import 'package:unknown_note_flutter/pages/write_diary/widgets/write_diary_open_switch.dart';
import 'package:unknown_note_flutter/widgets/common_snackbar.dart';
import 'package:unknown_note_flutter/widgets/common_write_slide_widget.dart';
import 'package:unknown_note_flutter/utils/date_formatter.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_button.dart';
import 'package:unknown_note_flutter/widgets/common_draggable.dart';
import 'package:unknown_note_flutter/widgets/common_horizontal_spliter.dart';
import 'package:unknown_note_flutter/widgets/common_loading_widget.dart';
import 'package:unknown_note_flutter/widgets/common_text_form.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';

class WriteDiaryPage extends StatefulWidget {
  final DiaryModel? diary;

  const WriteDiaryPage({
    super.key,
    this.diary,
  });

  @override
  State<WriteDiaryPage> createState() => _WriteDiaryPageState();
}

class _WriteDiaryPageState extends State<WriteDiaryPage> {
  late ValueNotifier<DiaryModel> _diary;

  @override
  void initState() {
    super.initState();
    _diary = ValueNotifier(widget.diary ??
        DiaryModel(
          isOpen: false,
          time: DateTime.now(),
        ));
  }

  bool _isUploading(WriteDiaryState state) {
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

  void _onEmotionTap() {
    DraggableMenu.open(
      context,
      CommonDraggable(
        child: ValueListenableBuilder(
          valueListenable: _diary,
          builder: (context, value, _) {
            return DiaryEmotionWidget(
              selected: value.emotion,
              onSelected: _onEmotionSelect,
            );
          },
        ),
      ),
    );
  }

  void _onEmotionSelect(EEmotion emotion) {
    _diary.value = _diary.value.copyWith(emotion: emotion);
  }

  void _onOpenChanged(bool value) {
    _diary.value = _diary.value.copyWith(isOpen: value);
  }

  void _onBodyChanged(String value) {
    _diary.value = _diary.value.copyWith(content: value);
  }

  void _onDelete() {
    setState(() {
      _diary.value = DiaryModel(
        isOpen: false,
        time: DateTime.now(),
      );
    });
  }

  void _upload() {
    context.read<WriteDiaryBloc>().add(WriteDiaryUpload(_diary.value));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WriteDiaryBloc, WriteDiaryState>(
      listener: (context, state) {
        if (state.status == EUploadStatus.success) {
          context.replace(
            '/diary/${_diary.value.id}',
            extra: _diary.value,
          );
        }
        if (state.status == EUploadStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            CommonSnackbar(
              context,
              content: AppFont(state.message ?? '수필 저장에 실패했습니다.'),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const AppFont(
            '일기 작성',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonButton(
                child: ValueListenableBuilder(
                  valueListenable: _diary,
                  builder: (context, value, child) {
                    return WriteDiaryEmotionButton(
                      onTap: _onEmotionTap,
                      emotion: _diary.value.emotion,
                    );
                  },
                ),
              ),
              Column(
                children: [
                  AppFont(
                    dateToYMD(_diary.value.time ?? DateTime.now()),
                    weight: FontWeight.w700,
                  ),
                  AppFont(
                    dateToE(_diary.value.time ?? DateTime.now()),
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: _diary,
                builder: (context, value, child) {
                  return WriteDiaryOpenSwitch(
                    value: value.isOpen ?? false,
                    onChanged: _onOpenChanged,
                  );
                },
              ),
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
                initText: _diary.value.content,
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
