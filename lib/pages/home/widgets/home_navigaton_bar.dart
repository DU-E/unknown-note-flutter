import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_home_screen.dart';
import 'package:unknown_note_flutter/pages/home/widgets/home_navigation_button.dart';
import 'package:unknown_note_flutter/widgets/common_blur_container.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonBlurContainer(
      borderRadius: Sizes.size10,
      fit: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeNavigationButton(screen: EHomeScreen.calendar),
          HomeNavigationButton(screen: EHomeScreen.diary),
          HomeNavigationButton(screen: EHomeScreen.essay),
          HomeNavigationButton(screen: EHomeScreen.myInfo),
        ],
      ),
    );
  }
}
