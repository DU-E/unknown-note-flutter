import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_button.dart';

class DiaryEmotionWidget extends StatelessWidget {
  final Function(EEmotion emotion)? onSelected;
  final EEmotion? selected;

  const DiaryEmotionWidget({
    super.key,
    this.onSelected,
    this.selected,
  });

  EEmotion _emotionIndexer(int idx) {
    switch (idx) {
      case 0:
        return EEmotion.happy;
      case 1:
        return EEmotion.love;
      case 2:
        return EEmotion.expect;
      case 3:
        return EEmotion.thanks;
      case 4:
        return EEmotion.sad;
      case 5:
        return EEmotion.anger;
      case 6:
        return EEmotion.fear;
      case 7:
        return EEmotion.regret;
    }
    return EEmotion.happy;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.size20),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.emoji_emotions_rounded,
                color: Colors.white,
                size: Sizes.size28,
              ),
              Gaps.h5,
              AppFont(
                '감정을 선택해주세요.',
                color: Colors.white,
                size: Sizes.size16,
                weight: FontWeight.w700,
              ),
            ],
          ),
          Gaps.v10,
          GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: Sizes.size5,
              mainAxisSpacing: Sizes.size5,
            ),
            itemBuilder: (context, index) => _emotionButton(
              context,
              emotion: _emotionIndexer(index),
            ),
            itemCount: 8,
          ),
        ],
      ),
    );
  }

  Widget _emotionButton(
    BuildContext context, {
    required EEmotion emotion,
  }) {
    bool isSelected = (emotion == selected);

    return CommonButton(
      color: isSelected
          ? Theme.of(context).primaryColor.withOpacity(0.4)
          : Colors.transparent,
      foregroundColor: Colors.white,
      shadowColor: Colors.transparent,
      onTap: () => onSelected?.call(emotion),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          if (isSelected)
            Padding(
              padding: const EdgeInsets.all(Sizes.size2),
              child: Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/emotions/${emotion.key}_img.png',
                  width: Sizes.size40,
                  height: Sizes.size40,
                ),
                Gaps.v4,
                AppFont(
                  emotion.text,
                  color: Colors.white,
                  weight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
