import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/enums/enum_font.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';

class UserInfoFlower extends StatelessWidget {
  final EEmotion flower;
  final ELoadingStatus status;

  const UserInfoFlower({
    super.key,
    required this.flower,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size20,
        vertical: Sizes.size10,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            flower.color.withOpacity(0.7),
            Colors.white.withOpacity(0),
          ],
          stops: const [0, 0.2],
        ),
      ),
      child: status == ELoadingStatus.loading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/flowers/${flower.key}_flower.png',
                  width: Sizes.size72,
                  height: Sizes.size72,
                ),
                Gaps.h20,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppFont(
                        flower.data.name,
                        font: EFont.cafe24Dongdong,
                        size: Sizes.size20,
                      ),
                      AppFont(
                        flower.data.mean,
                        font: EFont.cafe24Dongdong,
                      ),
                      Gaps.v5,
                      Container(
                        height: Sizes.size1,
                        color: flower.color,
                      ),
                      Gaps.v5,
                      AppFont(
                        flower.data.text[Random(DateTime.now().millisecond)
                            .nextInt(flower.data.text.length)],
                        font: EFont.cafe24Dongdong,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
