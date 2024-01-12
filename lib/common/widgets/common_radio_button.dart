import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_font.dart';

class CommonRadioButton extends StatelessWidget {
  final String title;
  final EFont? font;
  final IconData? icon;
  final bool isSelected;
  final Function()? onTap;

  const CommonRadioButton({
    super.key,
    required this.title,
    this.font,
    this.icon,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
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
                if (icon != null) Icon(icon),
                if (icon != null) Gaps.h10,
                AppFont(
                  title,
                  weight: FontWeight.w700,
                  font: font ?? EFont.pretendard,
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
