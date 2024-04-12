import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/bloc/splash/splash_cubit.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/enums/enum_splash.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _afterFirstBuild());
  }

  void _afterFirstBuild() {
    context.read<SplashCubit>().setSplash(ESplash.extraData);
  }

  Future<void> _getExtraData() async {
    print('[TEST] Get extra data...');
    await Future.delayed(const Duration(seconds: 1));
    print('[TEST] Get extra data done.');

    // ignore: use_build_context_synchronously
    context.read<SplashCubit>().setSplash(ESplash.getUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<SplashCubit, ESplash>(
          listener: (context, state) {
            if (state == ESplash.extraData) {
              _getExtraData();
            }
            if (state == ESplash.getUser) {
              AuthBlocSingleton.bloc.add(AuthGetUserEvent());
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                Gaps.v10,
                AppFont(state.text),
              ],
            );
          },
        ),
      ),
    );
  }
}
