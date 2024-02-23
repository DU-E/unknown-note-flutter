import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/dio/auth_interceptor.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';

class DudeUserRepository {
  Future<ResModel<UserModel>> getUser() async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // var res = await dio.get(
    //   '/user',
    // );

    // TODO: connect api
    FlutterSecureStorage storage = const FlutterSecureStorage();
    var token = await storage.read(key: Strings.jwtToken);
    print('[DudeUserRepository.getUser] $token');

    await Future.delayed(const Duration(seconds: 1));
    var resTmp = ResModel<UserModel>(
      code: 1000,
      data: UserModel(
        userId: 1,
        nickName: 'testWoong',
        introduce: 'Hello world!',
      ),
    ).toJson((user) => user.toJson());

    var res = ResModel<UserModel>.fromJson(
      resTmp,
      (json) => UserModel.fromJson(json),
    );

    return res;
  }
}
