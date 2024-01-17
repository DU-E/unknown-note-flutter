import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'dart:math' as math;

class MyInfoProfileWidget extends StatelessWidget {
  const MyInfoProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Transform.translate(
          offset: const Offset(0, -Sizes.size96),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Transform.translate(
                    offset: const Offset(0, Sizes.size8),
                    child: Transform.rotate(
                      angle: math.pi / 4,
                      child: Container(
                        width: Sizes.size20,
                        height: Sizes.size20,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                      horizontal: Sizes.size16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(Sizes.size5),
                    ),
                    child: const AppFont(
                      'introduce',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Gaps.v20,
              const CircleAvatar(radius: Sizes.size40),
            ],
          ),
        ),
        Container(
          color: Theme.of(context).primaryColor.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size32,
              horizontal: Sizes.size52,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _infoText(
                      title: '일기',
                      value: '3',
                    ),
                    Gaps.h32,
                    _verticalDivider(),
                  ],
                ),
                _infoText(
                  title: '닉네임',
                  value: '@asasd',
                  size: Sizes.size14,
                ),
                Row(
                  children: [
                    _verticalDivider(),
                    Gaps.h32,
                    _infoText(
                      title: '수필',
                      value: '3',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(
      width: Sizes.size1,
      height: Sizes.size20,
      color: Colors.grey.shade400,
    );
  }

  Widget _infoText({
    required String title,
    required String value,
    double? size,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppFont(
          title,
          size: Sizes.size16,
          color: Colors.white,
        ),
        SizedBox(
          height: Sizes.size32,
          child: Center(
            child: AppFont(
              value,
              size: size ?? Sizes.size20,
              color: Colors.white,
              weight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
