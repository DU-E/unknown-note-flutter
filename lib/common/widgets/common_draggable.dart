import 'dart:ui';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CommonDraggable extends StatelessWidget {
  final Widget child;
  final double initHeight;

  const CommonDraggable({
    super.key,
    required this.child,
    required this.initHeight,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableMenu(
      ui: _CustomUi(),
      levels: [
        DraggableMenuLevel(
          height: initHeight + MediaQuery.of(context).padding.bottom,
        ),
        DraggableMenuLevel.ratio(ratio: 1),
      ],
      child: child,
    );
  }
}

class _CustomUi extends CustomDraggableMenu {
  @override
  Widget buildUi(
    BuildContext context,
    Widget child,
    DraggableMenuStatus status,
    int level,
    double menuValue,
    double? raw,
    double levelValue,
    Duration animationDuration,
    Curve curve,
  ) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(Sizes.size10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.size20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.6),
                borderRadius: const BorderRadiusDirectional.vertical(
                  top: Radius.circular(Sizes.size20),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
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
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
