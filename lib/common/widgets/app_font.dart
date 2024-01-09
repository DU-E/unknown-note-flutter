import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/fonts.dart';

class AppFont extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final List<Shadow>? shadows;
  final String? fontFamily;

  const AppFont(
    this.text, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.shadows,
    this.fontFamily = FontFamily.pretendard,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        shadows: shadows,
        fontFamily: fontFamily,
      ),
    );
  }
}
