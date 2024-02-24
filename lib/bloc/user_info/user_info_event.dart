import 'package:unknown_note_flutter/models/user/user_model.dart';

abstract class UserInfoEvent {}

class UserInfoUpdateUser extends UserInfoEvent {
  final UserModel user;

  UserInfoUpdateUser(this.user);
}

class UserInfoGet extends UserInfoEvent {
  final int userId;

  UserInfoGet(this.userId);
}
