import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CommonButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;

  const CommonButton({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.size10),
        ),
        surfaceTintColor: Colors.white,
        shadowColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
          horizontal: Sizes.size10,
        ),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
