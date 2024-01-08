import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_button.dart';
import 'package:unknown_note_flutter/enums/enum_auth_method.dart';

class SigninButton extends StatelessWidget {
  final EAuthMethod method;
  final Function() onTap;

  const SigninButton({
    super.key,
    required this.method,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onTap: onTap,
      child: Row(
        children: [
          Icon(method.icon),
          AppFont('Sign In with ${method.key.toLowerCase()}'),
        ],
      ),
    );
  }
}
