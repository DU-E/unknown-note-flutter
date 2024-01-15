import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/enums/enum_auth_method.dart';
import 'package:unknown_note_flutter/repository/authentication_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with ChangeNotifier {
  final AuthenticationRepository authenticationRepository;

  AuthBloc({
    required this.authenticationRepository,
  }) : super(AuthInitState()) {
    on<AuthGoogleSigninEvent>(_authGoogleSigninEventHandler);
    on<AuthKakaoSigninEvent>(_authKakaoSigninEventHandler);
    on<AuthNaverSigninEvent>(_authNaverSigninEventHandler);
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

  Future<void> _authKakaoSigninEventHandler(
    AuthKakaoSigninEvent evnet,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoadingState());
      // oauth2 with kakao
      var res = await authenticationRepository.signinWithKakao();
      // TODO: server api
      emit(AuthUnAuthState(
        method: EAuthMethod.kakao,
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

  Future<void> _authNaverSigninEventHandler(
    AuthNaverSigninEvent evnet,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoadingState());
      // oauth2 with naver
      var res = await authenticationRepository.signinWithNaver();
      // TODO: server api
      emit(AuthUnAuthState(
        method: EAuthMethod.naver,
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
        // method == kakao
        if ((state as AuthUnAuthState).method == EAuthMethod.kakao) {}
        // method == naver
        if ((state as AuthUnAuthState).method == EAuthMethod.kakao) {
          await authenticationRepository.signoutWithNaver();
        }
      }

      // case AuthAuthState
      if (state is AuthAuthState) {
        // method == google
        if ((state as AuthUnAuthState).method == EAuthMethod.google) {
          await authenticationRepository.signoutWithGoogle();
        }
        // method == kakao
        if ((state as AuthUnAuthState).method == EAuthMethod.kakao) {}
        // method == naver
        if ((state as AuthUnAuthState).method == EAuthMethod.kakao) {
          await authenticationRepository.signoutWithNaver();
        }
      }

      emit(AuthUnknownState());
    } catch (e) {
      print('error + ${e.toString()}');
      emit(AuthErrorState(
        message: e.toString(),
      ));
    } finally {
      notifyListeners();
    }
  }
}
