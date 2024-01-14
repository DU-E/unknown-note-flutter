import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_shadow_container.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';

class DiaryCard extends StatelessWidget {
  final DiaryModel diray;

  const DiaryCard({
    super.key,
    required this.diray,
  });

  @override
  Widget build(BuildContext context) {
    return CommonShadowContainer(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.size20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    width: Sizes.size64,
                    height: Sizes.size64,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Gaps.v10,
                  AppFont(diray.date?.toString() ?? 'asd'),
                  AppFont(diray.date?.toString() ?? 'asd'),
                  Gaps.v20,
                ],
              ),
            ),
            AppFont(diray.body ?? 'asd'),
          ],
        ),
      ),
    );
  }
}
