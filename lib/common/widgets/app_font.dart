import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/enums/enum_font.dart';

class AppFont extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final List<Shadow>? shadows;
  final EFont font;

  const AppFont(
    this.text, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.shadows,
    this.font = EFont.pretendard,
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
        fontFamily: font.fontFamily,
      ),
    );
  }
}
