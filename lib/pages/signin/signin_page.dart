import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_button.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_auth_method.dart';
import 'package:unknown_note_flutter/pages/signin/widgets/signin_button.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: Column(
          children: [
            const AppFont('Sign In'),
            SigninButton(
              method: EAuthMethod.google,
              onTap: () {
                context.read<AuthBloc>().add(AuthGoogleSigninEvent());
              },
            ),
            Gaps.v20,
            CommonButton(
              onTap: () {
                context.read<AuthBloc>().add(AuthSignoutEvent());
              },
              child: const AppFont('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
