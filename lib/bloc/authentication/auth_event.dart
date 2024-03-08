import 'package:unknown_note_flutter/models/user/user_model.dart';

abstract class AuthEvent {}

class AuthGoogleSigninEvent extends AuthEvent {}

class AuthKakaoSigninEvent extends AuthEvent {}

class AuthNaverSigninEvent extends AuthEvent {}

class AuthSignoutEvent extends AuthEvent {}

class AuthGetUserEvent extends AuthEvent {}

class AuthSetUserEvnet extends AuthEvent {
  final UserModel user;

  AuthSetUserEvnet(this.user);
}
