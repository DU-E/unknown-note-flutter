import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_button.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_auth_method.dart';
import 'package:unknown_note_flutter/enums/enum_font.dart';

class SigninButton extends StatelessWidget {
  final EAuthMethod method;
  final Function() onTap;

  const SigninButton({
    super.key,
    required this.method,
    required this.onTap,
  });

  ColorFilter? _colorFilter() {
    switch (method) {
      case EAuthMethod.google:
        return null;
      case EAuthMethod.kakao:
        return const ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        );
      case EAuthMethod.naver:
        return const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        );
    }
  }

  Color _bgColor() {
    switch (method) {
      case EAuthMethod.google:
        return Colors.white;
      case EAuthMethod.kakao:
        return const Color(0xFFFEE500);
      case EAuthMethod.naver:
        return const Color(0xFF03C75A);
    }
  }

  Color _fontColor() {
    switch (method) {
      case EAuthMethod.google:
        return Colors.grey.shade800;
      case EAuthMethod.kakao:
        return const Color.fromRGBO(0, 0, 0, 0.85);
      case EAuthMethod.naver:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onTap: onTap,
      color: _bgColor(),
      child: Row(
        children: [
          Gaps.h20,
          SvgPicture.asset(
            'assets/svgs/${method.key.toLowerCase()}.svg',
            width: Sizes.size20,
            height: Sizes.size20,
            colorFilter: _colorFilter(),
            clipBehavior: Clip.hardEdge,
          ),
          Gaps.h10,
          AppFont(
            'Sign in with ${method.key}',
            color: _fontColor(),
            font: EFont.roboto,
          ),
        ],
      ),
    );
  }
}
