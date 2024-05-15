import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/dio/auth_interceptor.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';
import 'package:unknown_note_flutter/repository/interface/interfece_dude_user_repository.dart';

class DudeUserRepository implements IDudeUserRepository {
  @override
  Future<ResModel<UserModel>> getUser() async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.get(
      '/user',
    );

    FlutterSecureStorage storage = const FlutterSecureStorage();
    var token = await storage.read(key: Strings.jwtToken);
    print('[DudeUserRepository.getUser] $token');

    var resModel = ResModel<UserModel>.fromJson(
      res.data,
      (json) => UserModel.fromJson(json),
    );

    return resModel;
  }

  @override
  Future<ResModel<void>> patchUser({
    required UserModel user,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.patch(
      '/user',
      data: user.toJson(),
    );

    var resModel = ResModel<void>.fromJson(
      res.data,
      (json) => {},
    );

    return resModel;
  }

  @override
  Future<ResModel<UserProfileModel>> getUserProfile({
    required int userId,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.get(
      '/profile',
      queryParameters: {
        'user_id': userId,
      },
    );

    var resModel = ResModel<UserProfileModel>.fromJson(
      res.data,
      (json) => UserProfileModel.fromJson(json),
    );

    return resModel;
  }

  @override
  Future<ResModel<void>> postSubscribe({
    required int userId,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.post(
      '/user/subscribe',
      queryParameters: {
        'target_user_id': userId,
      },
    );

    var resModel = ResModel<void>.fromJson(
      res.data,
      (json) {},
    );

    return resModel;
  }

  @override
  Future<ResModel<void>> deleteSubscribe({
    required int userId,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.delete(
      '/user/subscribe',
      queryParameters: {
        'target_user_id': userId,
      },
    );

    var resModel = ResModel<void>.fromJson(
      res.data,
      (json) {},
    );

    return resModel;
  }
}
