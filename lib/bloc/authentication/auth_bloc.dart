import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_auth_method.dart';
import 'package:unknown_note_flutter/models/oauth2/oauth2_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/interface/interface_authentication_repository.dart';
import 'package:unknown_note_flutter/repository/interface/interfece_dude_user_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with ChangeNotifier {
  final IAuthenticationRepository authenticationRepository;
  final IDudeUserRepository dudeUserRepository;

  AuthBloc({
    required this.authenticationRepository,
    required this.dudeUserRepository,
  }) : super(AuthInitState()) {
    on<AuthGoogleSigninEvent>(_authGoogleSigninEventHandler);
    on<AuthKakaoSigninEvent>(_authKakaoSigninEventHandler);
    on<AuthNaverSigninEvent>(_authNaverSigninEventHandler);
    on<AuthSignoutEvent>(_authSignoutEventHandler);
    on<AuthGetUserEvent>(_authGetUserEventHandler);
    on<AuthSetUserEvnet>(_authSetUserEventHandler);
  }

  Future<void> _authGoogleSigninEventHandler(
    AuthGoogleSigninEvent evnet,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoadingState());
      // oauth2 with google
      var res = await authenticationRepository.signinWithGoogle();

      await _authSignin(
        emit,
        method: EAuthMethod.google,
        oauth: res,
      );
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

      await _authSignin(
        emit,
        method: EAuthMethod.kakao,
        oauth: res,
      );
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

      await _authSignin(
        emit,
        method: EAuthMethod.naver,
        oauth: res,
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthErrorState(
        message: e.toString(),
      ));
    } finally {
      notifyListeners();
    }
  }

  Future<void> _authSignin(
    Emitter<AuthState> emit, {
    required EAuthMethod method,
    required OAuth2Model oauth,
  }) async {
    try {
      var res = await authenticationRepository.dudeSignin(
        method: method,
        accessToken: oauth.token,
      );

      // Save jwt at secure_storage
      FlutterSecureStorage storage = const FlutterSecureStorage();
      await storage.write(
        key: Strings.jwtToken,
        value: res.data,
      );

      // Return to splash screen
      emit(AuthInitState());
    } on DioException catch (e) {
      var error = e.error as ResModel<void>;
      emit(AuthErrorState(
        message: '[${error.code}] ${error.message as String}',
      ));
    } catch (e) {
      emit(AuthErrorState(
        message: '[5001] ${e.toString()}',
      ));
    }
  }

  Future<void> _authSignoutEventHandler(
    AuthSignoutEvent evnet,
    Emitter<AuthState> emit,
  ) async {
    try {
      // Remove jwt at secure_storage
      FlutterSecureStorage storage = const FlutterSecureStorage();
      await storage.delete(key: Strings.jwtToken);

      await authenticationRepository.signoutWithGoogle();
      await authenticationRepository.signoutWithNaver();

      emit(AuthUnknownState());
    } catch (e) {
      emit(AuthErrorState(
        message: e.toString(),
      ));
    } finally {
      notifyListeners();
    }
  }

  Future<void> _authGetUserEventHandler(
    AuthGetUserEvent evnet,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      var res = await dudeUserRepository.getUser();

      // TODO: probably not necessary
      if (res.code == 2000 || res.data == null) {
        await _authSignoutEventHandler(AuthSignoutEvent(), emit);
        return;
      }

      print('[AuthBloc._authGetUserEventHandler] ${res.data}');

      if (res.data?.nickName != null) {
        emit(AuthAuthState(
          user: res.data!,
        ));
      } else {
        emit(AuthUnAuthState(
          user: res.data!,
        ));
      }
    } on DioException catch (e) {
      var error = e.error as ResModel<void>;
      emit(AuthErrorState(
        message: '[${error.code}] ${error.message as String}',
      ));
    } catch (e) {
      emit(AuthErrorState(
        message: '[5001] ${e.toString()}',
      ));
    } finally {
      notifyListeners();
    }
  }

  Future<void> _authSetUserEventHandler(
    AuthSetUserEvnet event,
    Emitter<AuthState> emit,
  ) async {
    if (event.user.nickName?.isNotEmpty == true) {
      emit(AuthAuthState(user: event.user));
    } else {
      emit(AuthUnAuthState(user: event.user));
    }
  }
}
