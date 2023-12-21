import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';

class EssayCategoryButton extends StatelessWidget {
  final EEssayCategory category;

  const EssayCategoryButton({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
            const AppFont('선택됨'),
          ],
        ),
      ),
    );
  }
}
