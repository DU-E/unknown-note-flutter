import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/mixins/mock_throw_exception_mixin.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';
import 'package:unknown_note_flutter/repository/interface/interfece_dude_user_repository.dart';
import 'package:unknown_note_flutter/utils/mock_dio_error.dart';

class MockDudeUserRepository
    with MockThrowExceptionMixin
    implements IDudeUserRepository {
  final int delay;
  final int? errorCode;

  MockDudeUserRepository({
    this.delay = 1000,
    this.errorCode,
  });

  @override
  Future<ResModel<UserModel>> getUser() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    var token = await storage.read(key: Strings.jwtToken);
    print('[DudeUserRepository.getUser] $token');

    await Future.delayed(Duration(milliseconds: delay));

    return mockedResponse<ResModel<UserModel>>(
      () {
        if (token == null) {
          mockThrowDioError(
            errorModel: ResModel(code: 2000, message: '로그인에 실패했습니다.'),
          );
        }

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
      },
      errorCode: errorCode,
    );
  }

  @override
  Future<ResModel<void>> patchUser({
    required UserModel user,
  }) async {
    await Future.delayed(Duration(milliseconds: delay));

    return mockedResponse<ResModel<void>>(
      () {
        var resTmp = ResModel<void>(code: 1000).toJson((p0) => null);

        var res = ResModel<void>.fromJson(resTmp, (json) => {});

        return res;
      },
      errorCode: errorCode,
    );
  }

  @override
  Future<ResModel<UserProfileModel>> getUserProfile({
    required int userId,
  }) async {
    await Future.delayed(Duration(milliseconds: delay));

    return mockedResponse<ResModel<UserProfileModel>>(
      () {
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
      },
      errorCode: errorCode,
    );
  }

  @override
  Future<ResModel<void>> postSubscribe({
    required int userId,
  }) async {
    await Future.delayed(Duration(milliseconds: delay));

    return mockedResponse<ResModel<void>>(
      () {
        var resTmp = ResModel<void>(code: 1000).toJson((p0) => null);

        var res = ResModel<void>.fromJson(resTmp, (json) {});

        return res;
      },
      errorCode: errorCode,
    );
  }

  @override
  Future<ResModel<void>> deleteSubscribe({
    required int userId,
  }) async {
    await Future.delayed(Duration(milliseconds: delay));

    return mockedResponse<ResModel<void>>(
      () {
        var resTmp = ResModel<void>(code: 1000).toJson((p0) => null);

        var res = ResModel<void>.fromJson(resTmp, (json) {});

        return res;
      },
      errorCode: errorCode,
    );
  }
}
