import 'dart:ui';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CommonDraggable extends StatelessWidget {
  final Widget child;

  const CommonDraggable({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableMenu(
      ui: ModernDraggableMenu(
        barItem: Container(
          width: double.infinity,
          height: Sizes.size24,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Container(
              width: Sizes.size40,
              height: Sizes.size4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Sizes.size10),
              ),
            ),
          ),
        ),
        color: Theme.of(context).primaryColor.withOpacity(0.4),
        radius: Sizes.size20,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(Sizes.size20),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: child,
        ),
      ),
    );
  }
}
