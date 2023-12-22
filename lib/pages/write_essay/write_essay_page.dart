import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_event.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_horizontal_spliter.dart';
import 'package:unknown_note_flutter/common/widgets/common_slide_up_panel.dart';
import 'package:unknown_note_flutter/common/widgets/common_text_form.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
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
    context.read<WriteEssayBloc>().add(WriteEssaySetTitle(
          title: _title ?? '',
        ));
    context.read<WriteEssayBloc>().add(WriteEssaySetBody(
          body: _body ?? '',
        ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CommonSlideUpPanel(
      slideBuilder: (controller) => WriteEssaySettingWidget(
        isHide: controller.status == SlidingUpPanelStatus.hidden,
        onDelete: _onDelete,
      ),
      childBuilder: (controller) => Scaffold(
        appBar: AppBar(
          title: const AppFont(
            '수필 작성',
            size: Sizes.size20,
          ),
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
          foregroundColor: Colors.white,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.collapse();
              },
              icon: const Icon(Icons.settings_rounded),
            ),
            IconButton(
              onPressed: _save,
              icon: const Icon(Icons.save_rounded),
            ),
          ],
        ),
        body: Padding(
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
              CommonTextForm(
                initText: _title,
                getValue: (value) {
                  _title = value;
                },
              ),
              Gaps.v10,
              AppFont(
                '내용',
                color: Theme.of(context).primaryColor,
              ),
              const CommonHorizontalSpliter(),
              Expanded(
                child: SingleChildScrollView(
                  child: CommonTextForm(
                    initText: _body,
                    getValue: (value) {
                      _body = value;
                    },
                    singleLine: false,
                    isDynamicSize: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
