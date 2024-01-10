import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_loading_widget.dart';
import 'package:unknown_note_flutter/constants/fonts.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_auth_method.dart';
import 'package:unknown_note_flutter/pages/signin/widgets/signin_button.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppFont(
                    '익명 일기',
                    fontFamily: FontFamily.roboto,
                    size: Sizes.size40,
                    weight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  AppFont(
                    'Sign in',
                    fontFamily: FontFamily.roboto,
                    size: Sizes.size20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(Sizes.size20),
              ),
            ),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CommonLoadingWidget(
                      color: Colors.white,
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
                  child: Column(
                    children: [
                      Gaps.v20,
                      const AppFont(
                        '간편 로그인',
                        color: Colors.white,
                      ),
                      Gaps.v20,
                      SigninButton(
                        method: EAuthMethod.google,
                        onTap: () {
                          context.read<AuthBloc>().add(AuthGoogleSigninEvent());
                        },
                      ),
                      Gaps.v10,
                      SigninButton(
                        method: EAuthMethod.kakao,
                        onTap: () {
                          context.read<AuthBloc>().add(AuthKakaoSigninEvent());
                        },
                      ),
                      Gaps.v10,
                      SigninButton(
                        method: EAuthMethod.naver,
                        onTap: () {
                          context.read<AuthBloc>().add(AuthNaverSigninEvent());
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
