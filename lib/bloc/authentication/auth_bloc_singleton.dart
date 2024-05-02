import 'package:unknown_note_flutter/bloc/authentication/auth_bloc.dart';
import 'package:unknown_note_flutter/repository/interface/interface_authentication_repository.dart';
import 'package:unknown_note_flutter/repository/interface/interfece_dude_user_repository.dart';

class AuthBlocSingleton {
  AuthBlocSingleton._constructor();
  static final AuthBlocSingleton _signleton = AuthBlocSingleton._constructor();
  static AuthBlocSingleton get instance => _signleton;

  static late final AuthBloc _bloc;
  static AuthBloc get bloc => _bloc;

  static initializer({
    required IAuthenticationRepository authRepository,
    required IDudeUserRepository userRepository,
  }) {
    _bloc = AuthBloc(
      authenticationRepository: authRepository,
      dudeUserRepository: userRepository,
    );
  }
}
