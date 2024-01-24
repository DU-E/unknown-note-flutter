import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_shadow_container.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';

class DiaryCard extends StatelessWidget {
  final DiaryModel diary;

  const DiaryCard({
    super.key,
    required this.diary,
  });

  @override
  Widget build(BuildContext context) {
    return CommonShadowContainer(
      child: Padding(
        padding: const EdgeInsets.only(
          left: Sizes.size20,
          right: Sizes.size20,
          bottom: Sizes.size20,
          top: Sizes.size5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Gaps.v10,
                  Image.asset(
                    'assets/images/emotions/${diary.emotion?.key ?? 'happy'}_img.png',
                    width: Sizes.size72,
                    height: Sizes.size72,
                  ),
                  Gaps.v4,
                  AppFont(diary.time?.toString() ?? 'asd'),
                  AppFont(diary.time?.toString() ?? 'asd'),
                  Gaps.v20,
                ],
              ),
            ),
            AppFont(diary.content ?? 'asd'),
          ],
        ),
      ),
    );
  }
}
