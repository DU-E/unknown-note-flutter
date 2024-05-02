import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/mixins/mock_throw_exception_mixin.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';
import 'package:unknown_note_flutter/repository/interface/interface_dude_essay_repository.dart';

class MockDudeEssayRepository
    with MockThrowExceptionMixin
    implements IDudeEssayRepository {
  final int delay;
  final int? errorCode;

  MockDudeEssayRepository({
    this.delay = 1000,
    this.errorCode,
  });

  @override
  Future<ResModel<List<EssayModel>>> getEssayList({
    required EEssayCategory category,
    required int page,
  }) async {
    await Future.delayed(Duration(milliseconds: delay));

    return mockedResponse<ResModel<List<EssayModel>>>(
      () {
        var resTmp = ResModel<List<EssayModel>>(
          code: 1000,
          data: [
            for (int i = 1; i <= 20; i++)
              EssayModel(
                id: page * 20 + i,
                title: '${page * 20 + i}th ${category.key}',
                content: '${page * 20 + i}th ${category.key} contents blah',
                time: DateTime(2023, 12, 21, 13, 09)
                    .add(Duration(minutes: page * 20 + i)),
                likes: 10,
                category: category,
                user: UserModel(
                  userId: 1,
                  nickName: 'testWoong',
                  introduce: 'Hello world!',
                ),
              ),
          ],
        ).toJson(
          (essayList) => essayList.map((essay) => essay.toJson()).toList(),
        );

        var res = ResModel<List<EssayModel>>.fromJson(
          resTmp,
          (json) => (json as List<dynamic>)
              .map((essay) => EssayModel.fromJson(essay))
              .toList(),
        );

        return res;
      },
      errorCode: errorCode,
    );
  }

  @override
  Future<ResModel<List<EssayModel>>> getUserEssayList({
    required int userId,
    required int page,
  }) async {
    await Future.delayed(Duration(milliseconds: delay));

    return mockedResponse<ResModel<List<EssayModel>>>(
      () {
        var resTmp = ResModel<List<EssayModel>>(
          code: 1000,
          data: [
            for (int i = 1; i <= 20; i++)
              EssayModel(
                id: page * 20 + i,
                title: '${page * 20 + i}th $userId\'s essay',
                content: '${page * 20 + i}th $userId\'s essay contents blah',
                time: DateTime(2023, 12, 21, 13, 09)
                    .add(Duration(minutes: page * 20 + i)),
                likes: 10,
                category: EEssayCategory.novel,
                user: UserModel(
                  userId: 1,
                  nickName: 'testWoong',
                  introduce: 'Hello world!',
                ),
              ),
          ],
        ).toJson(
          (essayList) => essayList.map((essay) => essay.toJson()).toList(),
        );

        var res = ResModel<List<EssayModel>>.fromJson(
          resTmp,
          (json) => (json as List<dynamic>)
              .map((essay) => EssayModel.fromJson(essay))
              .toList(),
        );

        return res;
      },
      errorCode: errorCode,
    );
  }

  @override
  Future<ResModel<EssayModel>> postEssay({
    required EssayModel essay,
  }) async {
    await Future.delayed(Duration(milliseconds: delay));

    return mockedResponse<ResModel<EssayModel>>(
      () {
        essay = essay.copyWith(
          user: (AuthBlocSingleton.bloc.state as AuthAuthState).user,
        );

        var resTmp = ResModel<EssayModel>(
          code: 1000,
          // message: 'diary saving failed',
          data: essay,
        ).toJson((essay) => essay.toJson());

        var res = ResModel<EssayModel>.fromJson(
          resTmp,
          (json) => EssayModel.fromJson(json),
        );

        return res;
      },
      errorCode: errorCode,
    );
  }

  @override
  Future<ResModel<EssayModel>> patchEssay({
    required EssayModel essay,
  }) async {
    await Future.delayed(Duration(milliseconds: delay));

    return mockedResponse<ResModel<EssayModel>>(
      () {
        essay = essay.copyWith(
          user: (AuthBlocSingleton.bloc.state as AuthAuthState).user,
        );

        var resTmp = ResModel<EssayModel>(
          code: 1000,
          // message: 'diary saving failed',
          data: essay,
        ).toJson((essay) => essay.toJson());

        var res = ResModel<EssayModel>.fromJson(
          resTmp,
          (json) => EssayModel.fromJson(json),
        );

        return res;
      },
      errorCode: errorCode,
    );
  }

  @override
  Future<ResModel<void>> postLike({
    required int essayId,
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
  Future<ResModel<void>> deleteLike({
    required int essayId,
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
