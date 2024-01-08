import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/enums/enum_auth_method.dart';
import 'package:unknown_note_flutter/repository/authentication_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with ChangeNotifier {
  AuthenticationRepository authenticationRepository;

  AuthBloc({
    required this.authenticationRepository,
  }) : super(AuthInitState()) {
    on<AuthGoogleSigninEvent>(_authGoogleSigninEventHandler);
    on<AuthSignoutEvent>(_authSignoutEventHandler);
  }

  Future<void> _authGoogleSigninEventHandler(
    AuthGoogleSigninEvent evnet,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoadingState());
      // oauth2 with google
      var res = await authenticationRepository.signinWithGoogle();
      // TODO: server api
      emit(AuthUnAuthState(
        method: EAuthMethod.google,
        oauth2: res,
      ));
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthErrorState(
        message: e.toString(),
      ));
    } finally {
      notifyListeners();
    }
  }

  Future<void> _authSignoutEventHandler(
    AuthSignoutEvent evnet,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoadingState());
      // case AuthUnAuthState
      if (state is AuthUnAuthState) {
        // method == google
        if ((state as AuthUnAuthState).method == EAuthMethod.google) {
          await authenticationRepository.signoutWithGoogle();
        }
      }

      // case AuthAuthState
      if (state is AuthAuthState) {
        // method == google
        if ((state as AuthUnAuthState).method == EAuthMethod.google) {
          await authenticationRepository.signoutWithGoogle();
        }
      }

      print('signout');
    } catch (e) {
      emit(AuthErrorState(
        message: e.toString(),
      ));
    } finally {
      notifyListeners();
    }
  }
}
