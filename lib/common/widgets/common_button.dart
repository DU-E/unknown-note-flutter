import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CommonButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? shadowColor;
  final Function()? onTap;

  const CommonButton({
    super.key,
    required this.child,
    this.color,
    this.shadowColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.size10),
        ),
        surfaceTintColor: shadowColor ?? Colors.white,
        shadowColor: shadowColor ?? Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(0),
        backgroundColor: color,
      ),
      clipBehavior: Clip.hardEdge,
      onPressed: onTap,
      child: child,
    );
  }
}
