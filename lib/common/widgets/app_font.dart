import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final List<Shadow>? shadows;

  const AppFont(
    this.text, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.gowunDodum(
        fontSize: size,
        fontWeight: weight,
        color: color,
        shadows: shadows,
      ),
    );
  }
}
