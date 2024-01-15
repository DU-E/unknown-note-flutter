import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_state.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_button.dart';
import 'package:unknown_note_flutter/common/widgets/common_horizontal_spliter.dart';
import 'package:unknown_note_flutter/common/widgets/common_loading_widget.dart';
import 'package:unknown_note_flutter/common/widgets/common_text_form.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';

class WriteDiaryPage extends StatefulWidget {
  const WriteDiaryPage({super.key});

  @override
  State<WriteDiaryPage> createState() => _WriteDiaryPageState();
}

class _WriteDiaryPageState extends State<WriteDiaryPage> {
  String? _content;

  @override
  void initState() {
    super.initState();
    _content = context.read<WriteDiaryBloc>().state.diary.content;
  }

  bool _isUploading(WriteDiaryState state) {
    return state.status == EUploadStatus.tagging ||
        state.status == EUploadStatus.uploading;
  }

  void _save() {
    context.read<WriteDiaryBloc>().add(WriteDiarySetContent(
          content: _content ?? '',
        ));
  }

  void _onDelete() {
    _content = '';
    _save();
    setState(() {});
  }

  void _onUpload() {
    _save();
    context.read<WriteDiaryBloc>().add(WriteDiaryUpload());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteDiaryBloc, WriteDiaryState>(
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
              onPressed: _isUploading(state) ? null : null,
              icon: const Icon(Icons.settings_rounded),
            ),
            IconButton(
              onPressed: _isUploading(state) ? null : _save,
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
        bottomNavigationBar: CommonButton(
          onTap: (_isUploading(state)) ? null : _onUpload,
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          shadowColor: Colors.transparent,
          borderRadius: 0,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + Sizes.size14,
              top: Sizes.size14,
            ),
            child: const AppFont(
              '저장',
              color: Colors.white,
              size: Sizes.size16,
              weight: FontWeight.w700,
            ),
          ),
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
                initText: _content,
                getValue: (value) {
                  _content = value;
                },
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
