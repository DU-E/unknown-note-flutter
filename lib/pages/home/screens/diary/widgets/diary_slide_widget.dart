import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_diary_category.dart';
import 'package:unknown_note_flutter/pages/home/screens/diary/widgets/diary_category_button.dart';

class DiarySlideWidget extends StatelessWidget {
  const DiarySlideWidget({super.key});

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
          DiaryCategoryButton(category: EDiaryCategory.recomm),
          DiaryCategoryButton(category: EDiaryCategory.mood),
          DiaryCategoryButton(category: EDiaryCategory.recent),
          DiaryCategoryButton(category: EDiaryCategory.rate),
          DiaryCategoryButton(category: EDiaryCategory.random),
        ],
      ),
    );
  }
}
