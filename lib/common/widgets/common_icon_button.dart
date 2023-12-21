import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CommonIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;

  const CommonIconButton({
    super.key,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        Sizes.size40,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(Sizes.size40),
          child: Ink(
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
            child: IconButton(
              onPressed: onTap,
              color: Colors.white,
              icon: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}
