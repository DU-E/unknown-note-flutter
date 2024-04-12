import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_radio_button.dart';

class WriteEssayCategorySlideWidget extends StatelessWidget {
  final Function(EEssayCategory category)? onSelected;
  final EEssayCategory? selected;

  const WriteEssayCategorySlideWidget({
    super.key,
    this.onSelected,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size10,
        horizontal: Sizes.size20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v14,
          const Row(
            children: [
              Icon(
                Icons.category_rounded,
                color: Colors.white,
                size: Sizes.size28,
              ),
              Gaps.h5,
              AppFont(
                '카테고리를 선택해주세요.',
                color: Colors.white,
                size: Sizes.size16,
                weight: FontWeight.w700,
              ),
            ],
          ),
          Gaps.v10,
          CommonRadioButton(
            icon: EEssayCategory.poem.icon,
            title: EEssayCategory.poem.title,
            isSelected: EEssayCategory.poem == selected,
            onTap: () {
              onSelected?.call(EEssayCategory.poem);
            },
          ),
          CommonRadioButton(
            icon: EEssayCategory.novel.icon,
            title: EEssayCategory.novel.title,
            isSelected: EEssayCategory.novel == selected,
            onTap: () {
              onSelected?.call(EEssayCategory.novel);
            },
          ),
          CommonRadioButton(
            icon: EEssayCategory.whisper.icon,
            title: EEssayCategory.whisper.title,
            isSelected: EEssayCategory.whisper == selected,
            onTap: () {
              onSelected?.call(EEssayCategory.whisper);
            },
          ),
          Gaps.v5,
        ],
      ),
    );
  }
}
