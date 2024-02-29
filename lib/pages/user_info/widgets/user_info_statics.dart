import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/enums/enum_font.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';

class UserInfoStatics extends StatelessWidget {
  final UserMonthlyEmotionModel emotionsData;

  const UserInfoStatics({
    super.key,
    required this.emotionsData,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(Sizes.size10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 1,
        mainAxisSpacing: Sizes.size10,
        crossAxisSpacing: Sizes.size10,
      ),
      children: [
        _emotionTile(
          context,
          emotion: EEmotion.happy,
          value: emotionsData.happy ?? 0,
        ),
        _emotionTile(
          context,
          emotion: EEmotion.love,
          value: emotionsData.love ?? 0,
        ),
        _emotionTile(
          context,
          emotion: EEmotion.expect,
          value: emotionsData.expect ?? 0,
        ),
        _emotionTile(
          context,
          emotion: EEmotion.thanks,
          value: emotionsData.thanks ?? 0,
        ),
        _emotionTile(
          context,
          emotion: EEmotion.sad,
          value: emotionsData.sad ?? 0,
        ),
        _emotionTile(
          context,
          emotion: EEmotion.anger,
          value: emotionsData.anger ?? 0,
        ),
        _emotionTile(
          context,
          emotion: EEmotion.fear,
          value: emotionsData.fear ?? 0,
        ),
        _emotionTile(
          context,
          emotion: EEmotion.regret,
          value: emotionsData.regret ?? 0,
        ),
      ],
    );
  }

  Widget _emotionTile(
    BuildContext context, {
    required EEmotion emotion,
    required int value,
  }) {
    return Container(
      height: Sizes.size72,
      decoration: BoxDecoration(
        border: Border.all(color: emotion.color),
        borderRadius: BorderRadius.circular(Sizes.size10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            emotion.color.withOpacity(0.5),
            emotion.color,
          ],
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(Sizes.size5),
            child: Image.asset(
              'assets/images/emotions/${emotion.key}_img.png',
              width: Sizes.size52,
              height: Sizes.size52,
            ),
          ),
          Gaps.h5,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppFont(
                emotion.text,
                font: EFont.cafe24Dongdong,
                size: Sizes.size16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: Sizes.size5),
                child: AppFont(
                  '${value.toString()}일',
                  font: EFont.cafe24Dongdong,
                  color: Colors.white,
                  weight: FontWeight.w700,
                  size: Sizes.size14,
                  shadows: const [
                    Shadow(
                      color: Colors.black,
                      blurRadius: Sizes.size10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
