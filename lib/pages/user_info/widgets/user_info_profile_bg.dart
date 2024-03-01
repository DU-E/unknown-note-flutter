import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gyro_provider/gyro_provider.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';

class UserInfoProfileBG extends StatelessWidget {
  final EEmotion? flower;

  const UserInfoProfileBG({
    super.key,
    this.flower,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background
        if (flower != null)
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset(
                  'assets/images/flowers/${flower!.key}_flower.png',
                ).image,
                fit: BoxFit.fitHeight,
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0),
                  flower!.color,
                  Colors.white.withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Center(
                child: GyroProvider.skew(
                  sensitivity: 0.0001,
                  child: _buildBG(flower!),
                ),
              ),
            ),
          ),
        // Loading cover
        AnimatedOpacity(
          opacity: flower == null ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBG(EEmotion flower) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            'assets/images/flowers/${flower.key}_flower.png',
            width: 200,
            height: 200,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 40),
            child: Transform.rotate(
              angle: 1,
              child: Image.asset(
                'assets/images/flowers/${flower.key}_flower.png',
                width: 140,
                height: 140,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
