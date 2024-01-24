import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_bloc.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_state.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_horizontal_spliter.dart';
import 'package:unknown_note_flutter/widgets/common_tagitem_widget.dart';
import 'package:unknown_note_flutter/widgets/common_zoom_controller.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';

class ReadDiaryPage extends StatelessWidget {
  final DiaryModel diary;

  const ReadDiaryPage({
    super.key,
    required this.diary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppFont(
          'Diary',
          size: Sizes.size20,
        ),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
        foregroundColor: Colors.white,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: implement like bloc
            },
            icon: const Icon(
              Icons.favorite_border_rounded,
              // Icons.favorite_rounded,
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.size20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const AppFont('Tags'),
                      Gaps.h5,
                      Wrap(
                        spacing: Sizes.size4,
                        runSpacing: Sizes.size4,
                        children: [
                          CommonTagItemWidget(
                            tag: diary.emotion?.key ?? EEmotion.happy.text,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gaps.v3,
                  Row(
                    children: [
                      const AppFont('Write at'),
                      Gaps.h5,
                      CommonTagItemWidget(
                        tag: diary.time?.toString() ?? Strings.nullStr,
                      ),
                    ],
                  ),
                  Gaps.v20,
                  const CommonHorizontalSpliter(),
                  Gaps.v20,
                  BlocBuilder<SettingBloc, SettingState>(
                    builder: (context, state) => AppFont(
                      diary.content ?? '',
                      size: state.getZoom(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(
                right: Sizes.size20,
                bottom: MediaQuery.of(context).padding.bottom + Sizes.size20,
              ),
              child: const CommonZoomController(),
            ),
          ),
        ],
      ),
    );
  }
}
