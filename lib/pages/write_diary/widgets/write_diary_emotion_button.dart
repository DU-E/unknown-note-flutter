import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_button.dart';

class WriteDiaryEmotionButton extends StatelessWidget {
  final Function() onTap;
  final EEmotion? emotion;

  const WriteDiaryEmotionButton({
    super.key,
    required this.onTap,
    this.emotion,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onTap: onTap,
      child: Container(
        width: Sizes.size72,
        height: Sizes.size72,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(Sizes.size10),
        ),
        child: emotion == null
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppFont(
                    '감정을',
                    size: Sizes.size14,
                  ),
                  AppFont(
                    '선택해주세요',
                    size: Sizes.size10,
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/emotions/${emotion!.key}_img.png',
                      width: Sizes.size40,
                      height: Sizes.size40,
                    ),
                    AppFont(
                      emotion!.text,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
