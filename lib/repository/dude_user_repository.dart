import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/dio/auth_interceptor.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';
import 'package:unknown_note_flutter/repository/interface/interfece_dude_user_repository.dart';

class DudeUserRepository implements IDudeUserRepository {
  @override
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

  @override
  Future<ResModel<void>> patchUser({
    required UserModel user,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // var res = await dio.patch(
    //   '/user',
    //   data: user.toJson(),
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<void>(code: 1000).toJson((p0) => null);

    var res = ResModel<void>.fromJson(resTmp, (json) => {});

    return res;
  }

  @override
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

    var today = DateTime.now().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
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
            date: today.subtract(const Duration(days: 1)),
            value: 0,
          ),
          UserStatsDataModel(
            date: today.subtract(const Duration(days: 2)),
            value: -0.2,
          ),
          UserStatsDataModel(
            date: today.subtract(const Duration(days: 3)),
            value: -0.3,
          ),
          UserStatsDataModel(
            date: today.subtract(const Duration(days: 10)),
            value: -0.1,
          ),
          UserStatsDataModel(
            date: today.subtract(const Duration(days: 20)),
            value: 0.2,
          ),
          UserStatsDataModel(
            date: today.subtract(const Duration(days: 30)),
            value: 1,
          ),
        ],
        monthlyAct: [
          UserStatsDataModel(
            date: today.subtract(const Duration(days: 1)),
            value: 1,
          ),
          UserStatsDataModel(
            date: today.subtract(const Duration(days: 2)),
            value: 3,
          ),
          UserStatsDataModel(
            date: today.subtract(const Duration(days: 3)),
            value: 5,
          ),
          UserStatsDataModel(
            date: today.subtract(const Duration(days: 10)),
            value: 7,
          ),
          UserStatsDataModel(
            date: today.subtract(const Duration(days: 20)),
            value: 4,
          ),
          UserStatsDataModel(
            date: today.subtract(const Duration(days: 30)),
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

    return res;
  }

  @override
  Future<ResModel<void>> postSubscribe({
    required int userId,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // var res = await dio.post(
    //   '/user/subscribe',
    //   queryParameters: {
    //     'target_user_id': userId,
    //   },
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<void>(code: 1000).toJson((p0) => null);

    var res = ResModel<void>.fromJson(resTmp, (json) {});

    return res;
  }

  @override
  Future<ResModel<void>> deleteSubscribe({
    required int userId,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // var res = await dio.delete(
    //   '/user/subscribe',
    //   queryParameters: {
    //     'target_user_id': userId,
    //   },
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<void>(code: 1000).toJson((p0) => null);

    var res = ResModel<void>.fromJson(resTmp, (json) {});

    return res;
  }
}
