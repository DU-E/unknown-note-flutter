import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';

abstract interface class IDudeUserRepository {
  Future<ResModel<UserModel>> getUser();

  Future<ResModel<void>> patchUser({
    required UserModel user,
  });

  Future<ResModel<UserProfileModel>> getUserProfile({
    required int userId,
  });

  Future<ResModel<void>> postSubscribe({
    required int userId,
  });

  Future<ResModel<void>> deleteSubscribe({
    required int userId,
  });
}
