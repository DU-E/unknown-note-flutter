import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_event.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_state.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_button.dart';
import 'package:unknown_note_flutter/common/widgets/common_horizontal_spliter.dart';
import 'package:unknown_note_flutter/common/widgets/common_loading_widget.dart';
import 'package:unknown_note_flutter/common/widgets/common_slide_up_panel.dart';
import 'package:unknown_note_flutter/common/widgets/common_text_form.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';
import 'package:unknown_note_flutter/pages/write_essay/widgets/write_essay_setting_widget.dart';

class WriteEssayPage extends StatefulWidget {
  const WriteEssayPage({super.key});

  @override
  State<WriteEssayPage> createState() => _WriteEssayPageState();
}

class _WriteEssayPageState extends State<WriteEssayPage> {
  String? _title;
  String? _body;

  @override
  void initState() {
    super.initState();
    _title = context.read<WriteEssayBloc>().state.essay.title;
    _body = context.read<WriteEssayBloc>().state.essay.body;
  }

  bool _isUploading(WriteEssayState state) {
    return state.status == EUploadStatus.tagging ||
        state.status == EUploadStatus.uploading;
  }

  void _save() {
    context.read<WriteEssayBloc>().add(WriteEssaySetTitle(
          title: _title ?? '',
        ));
    context.read<WriteEssayBloc>().add(WriteEssaySetBody(
          body: _body ?? '',
        ));
  }

  void _onDelete() {
    _title = '';
    _body = '';
    _save();
    setState(() {});
  }

  void _onUpload() {
    _save();
    context.read<WriteEssayBloc>().add(WriteEssayUpload());
  }

  @override
  Widget build(BuildContext context) {
    return CommonSlideUpPanel(
      slideBuilder: (controller) => WriteEssaySettingWidget(
        // isHide: controller.,
        onDelete: _onDelete,
      ),
      childBuilder: (controller) =>
          BlocBuilder<WriteEssayBloc, WriteEssayState>(
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
            '제목',
            color: Theme.of(context).primaryColor,
          ),
          const CommonHorizontalSpliter(),
          Container(
            color: Theme.of(context).primaryColor.withOpacity(0.05),
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
            child: SingleChildScrollView(
              child: CommonTextForm(
                initText: _title,
                getValue: (value) {
                  _title = value;
                },
              ),
            ),
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
                initText: _body,
                getValue: (value) {
                  _body = value;
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
