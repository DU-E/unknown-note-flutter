import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_auth_method.dart';
import 'package:unknown_note_flutter/models/oauth2/oauth2_model.dart';

abstract class AuthState extends Equatable {}

/// 초기 상태
class AuthInitState extends AuthState {
  @override
  List<Object?> get props => [];
}

/// 로그인하지 않은 상태
class AuthUnknownState extends AuthState {
  @override
  List<Object?> get props => [];
}

/// 소셜 로그인은 했으나, DB의 회원정보가 없는 상태
class AuthUnAuthState extends AuthState {
  final EAuthMethod method;
  final OAuth2Model oauth2;

  AuthUnAuthState({
    required this.method,
    required this.oauth2,
  });

  @override
  List<Object?> get props => [
        method,
        oauth2,
      ];
}

/// 소셜 로그인 및 DB의 회원정보가 있는 상태
class AuthAuthState extends AuthState {
  final EAuthMethod method;
  final OAuth2Model oauth2;

  AuthAuthState({
    required this.method,
    required this.oauth2,
  });

  @override
  List<Object?> get props => [
        method,
        oauth2,
      ];
}

/// 로딩 상태
class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

/// 에러 상태
class AuthErrorState extends AuthState {
  final String? message;

  AuthErrorState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
