import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CommonBlurContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final Color? color;
  final double borderRadius;
  final bool fit;
  final double height;

  const CommonBlurContainer({
    super.key,
    required this.child,
    this.blur = 10,
    this.color,
    this.borderRadius = 0,
    this.fit = false,
    this.height = Sizes.size56,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: fit ? null : double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).primaryColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}
