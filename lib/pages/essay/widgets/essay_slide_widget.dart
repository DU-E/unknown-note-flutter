import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/pages/essay/widgets/essay_category_button.dart';

class EssaySlideWidget extends StatelessWidget {
  const EssaySlideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: Sizes.size10,
        horizontal: Sizes.size20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          EssayCategoryButton(category: EEssayCategory.recomm),
          EssayCategoryButton(category: EEssayCategory.mood),
          EssayCategoryButton(category: EEssayCategory.recent),
          EssayCategoryButton(category: EEssayCategory.rate),
          EssayCategoryButton(category: EEssayCategory.random),
        ],
      ),
    );
  }
}
