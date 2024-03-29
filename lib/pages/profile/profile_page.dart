import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: remove
    debugPrint(
        '[LOG / token] ${(AuthBlocSingleton.bloc.state as AuthUnAuthState).oauth2.token}');
    return Scaffold(
      appBar: AppBar(
        title: const AppFont('Profile - Dev'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: BlocBuilder<AuthBloc, AuthState>(
            bloc: AuthBlocSingleton.bloc,
            builder: (context, state) => AppFont(
              (state as AuthUnAuthState).oauth2.token,
            ),
          ),
        ),
      ),
    );
  }
}
