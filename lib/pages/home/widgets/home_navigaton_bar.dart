import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_home_screen.dart';
import 'package:unknown_note_flutter/pages/home/widgets/home_navigation_button.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        Sizes.size10,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(
              Sizes.size10,
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              HomeNavigationButton(screen: EHomeScreen.calendar),
              HomeNavigationButton(screen: EHomeScreen.essay),
              HomeNavigationButton(screen: EHomeScreen.diary),
              HomeNavigationButton(screen: EHomeScreen.myInfo),
            ],
          ),
        ),
      ),
    );
  }
}
