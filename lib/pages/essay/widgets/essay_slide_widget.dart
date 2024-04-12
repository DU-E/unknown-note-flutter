import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';

class EssaySlideWidget extends StatelessWidget {
  final Function(EEssayCategory category)? onSelected;
  final EEssayCategory? selected;

  const EssaySlideWidget({
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
                '읽고싶은 카테고리를 선택해주세요.',
                color: Colors.white,
                size: Sizes.size16,
                weight: FontWeight.w700,
              ),
            ],
          ),
          Gaps.v10,
          _categoryButton(context, category: EEssayCategory.poem),
          _categoryButton(context, category: EEssayCategory.novel),
          _categoryButton(context, category: EEssayCategory.whisper),
          _categoryButton(context, category: EEssayCategory.subs),
          _categoryButton(context, category: EEssayCategory.favs),
        ],
      ),
    );
  }

  Widget _categoryButton(
    BuildContext context, {
    required EEssayCategory category,
  }) {
    bool isSelected = (category == selected);

    return ElevatedButton(
      onPressed: () => onSelected?.call(category),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size3,
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Sizes.size5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(category.icon),
                Gaps.h10,
                AppFont(
                  category.title,
                  weight: FontWeight.w700,
                ),
              ],
            ),
            if (isSelected) const AppFont('선택됨'),
          ],
        ),
      ),
    );
  }
}
