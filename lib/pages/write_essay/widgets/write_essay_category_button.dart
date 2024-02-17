import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_button.dart';

class WriteEssayCategoryButton extends StatelessWidget {
  final Function() onTap;

  final EEssayCategory? category;

  const WriteEssayCategoryButton({
    super.key,
    required this.onTap,
    this.category,
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
        child: category == null
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppFont(
                    '카테고리를',
                    size: Sizes.size12,
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
                    Icon(category!.icon),
                    AppFont(
                      category!.title,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
