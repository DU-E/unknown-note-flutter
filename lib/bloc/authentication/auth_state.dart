import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';

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
  final UserModel user;

  AuthUnAuthState({
    required this.user,
  });

  AuthUnAuthState copyWith({
    UserModel? user,
  }) =>
      AuthUnAuthState(
        user: user ?? this.user,
      );

  @override
  List<Object?> get props => [
        user,
      ];
}

/// 소셜 로그인 및 DB의 회원정보가 있는 상태
class AuthAuthState extends AuthState {
  final UserModel user;

  AuthAuthState({
    required this.user,
  });

  AuthAuthState copyWith({
    UserModel? user,
  }) =>
      AuthAuthState(
        user: user ?? this.user,
      );

  @override
  List<Object?> get props => [
        user,
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
