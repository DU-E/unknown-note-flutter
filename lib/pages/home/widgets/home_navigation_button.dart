import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/home/home_screen_cubit.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_home_screen.dart';

class HomeNavigationButton extends StatelessWidget {
  final EHomeScreen screen;

  const HomeNavigationButton({
    super.key,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, EHomeScreen>(
      builder: (context, state) => ElevatedButton(
        onPressed: () {
          context.read<HomeScreenCubit>().setScreen(screen);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size3,
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor:
              state == screen ? Colors.white : Colors.white.withOpacity(0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Sizes.size5,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: state == screen ? Sizes.size28 : 0,
              height: Sizes.size2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Sizes.size2,
                ),
              ),
            ),
            Gaps.v5,
            Icon(screen.icon),
            AppFont(
              screen.title,
              size: Sizes.size12,
            ),
          ],
        ),
      ),
    );
  }
}
