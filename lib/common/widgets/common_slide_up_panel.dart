import 'dart:ui';

import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CommonSlideUpPanel extends StatefulWidget {
  final Function(DraggableMenuController controller) childBuilder;
  final Function(DraggableMenuController controller) slideBuilder;
  final double minimumHeight;

  const CommonSlideUpPanel({
    super.key,
    required this.childBuilder,
    required this.slideBuilder,
    this.minimumHeight = 300,
  });

  @override
  State<CommonSlideUpPanel> createState() => _CommonSlideUpPanelState();
}

class _CommonSlideUpPanelState extends State<CommonSlideUpPanel> {
  late DraggableMenuController _slidingController;
  double dragStartPos = 0;

  @override
  void initState() {
    super.initState();
    _slidingController = DraggableMenuController();
    _slidingController.addListener(_onStateChange);
  }

  @override
  void dispose() {
    super.dispose();
    _slidingController.removeListener(_onStateChange);
    _slidingController.dispose();
  }

  void _onStateChange() {
    print('listened');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          // onTapDown: (details) {
          //   _slidingController.hide();
          // },
          child: widget.childBuilder(_slidingController),
        ),
      ],
    );
  }
}

class _CommonSlideUpPanelBody extends StatelessWidget {
  final Widget child;

  const _CommonSlideUpPanelBody({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        Sizes.size20,
      ),
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
                height: Sizes.size32,
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
    );
  }
}
