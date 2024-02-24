import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/dio/auth_interceptor.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';

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

  Future<ResModel<UserProfileModel>> getUserProfile({
    required int userId,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // var res = dio.get(
    //   '/profile',
    //   queryParameters: {
    //     'user_id': userId,
    //   },
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));
    var resTmp = ResModel<UserProfileModel>(
      code: 1000,
      data: UserProfileModel(
        user: UserModel(
          userId: 1,
          nickName: 'testWoong',
          introduce: 'Hello world!',
        ),
        diaryCount: 10,
        essayCount: 611,
        recentGraph: [
          UserStatsDataModel(
            date: DateTime(2024, 2, 1),
            value: 0,
          ),
          UserStatsDataModel(
            date: DateTime(2024, 2, 3),
            value: -0.2,
          ),
          UserStatsDataModel(
            date: DateTime(2024, 2, 5),
            value: -0.3,
          ),
          UserStatsDataModel(
            date: DateTime(2024, 2, 8),
            value: -0.1,
          ),
          UserStatsDataModel(
            date: DateTime(2024, 2, 10),
            value: 0.2,
          ),
          UserStatsDataModel(
            date: DateTime(2024, 2, 20),
            value: 0.5,
          ),
        ],
        monthlyAct: [
          UserStatsDataModel(
            date: DateTime(2024, 2, 1),
            value: 1,
          ),
          UserStatsDataModel(
            date: DateTime(2024, 2, 3),
            value: 3,
          ),
          UserStatsDataModel(
            date: DateTime(2024, 2, 5),
            value: 5,
          ),
          UserStatsDataModel(
            date: DateTime(2024, 2, 8),
            value: 7,
          ),
          UserStatsDataModel(
            date: DateTime(2024, 2, 10),
            value: 4,
          ),
          UserStatsDataModel(
            date: DateTime(2024, 2, 20),
            value: 2,
          ),
        ],
        monthlyEmotions: UserMonthlyEmotionModel(
          happy: 4,
          sad: 2,
          expect: 3,
        ),
        flower: EEmotion.happy,
      ),
    ).toJson((userProfile) => userProfile.toJson());

    var res = ResModel<UserProfileModel>.fromJson(
      resTmp,
      (json) => UserProfileModel.fromJson(json),
    );

    print(res);

    return res;
  }
}
