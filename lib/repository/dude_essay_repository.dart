import 'package:dio/dio.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/dio/auth_interceptor.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/interface/interface_dude_essay_repository.dart';

class DudeEssayRepository implements IDudeEssayRepository {
  @override
  Future<ResModel<List<EssayModel>>> getEssayList({
    required EEssayCategory category,
    required int page,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.get(
      '/essay',
      data: {
        'category': category.key,
        'page': page,
      },
    );

    var resModel = ResModel<List<EssayModel>>.fromJson(
      res.data,
      (json) => (json as List<dynamic>)
          .map((essay) => EssayModel.fromJson(essay))
          .toList(),
    );

    return resModel;
  }

  @override
  Future<ResModel<List<EssayModel>>> getUserEssayList({
    required int userId,
    required int page,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.get(
      '/essay/$userId',
      data: {
        'page': page,
      },
    );

    var resModel = ResModel<List<EssayModel>>.fromJson(
      res.data,
      (json) => (json as List<dynamic>)
          .map((essay) => EssayModel.fromJson(essay))
          .toList(),
    );

    return resModel;
  }

  @override
  Future<ResModel<EssayModel>> postEssay({
    required EssayModel essay,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.post(
      '/essay',
      data: essay.toJson(),
    );

    var resModel = ResModel<EssayModel>.fromJson(
      res.data,
      (json) => EssayModel.fromJson(json),
    );

    return resModel;
  }

  @override
  Future<ResModel<EssayModel>> patchEssay({
    required EssayModel essay,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.patch(
      '/essay',
      data: essay.toJson(),
    );

    var resModel = ResModel<EssayModel>.fromJson(
      res.data,
      (json) => EssayModel.fromJson(json),
    );

    return resModel;
  }

  @override
  Future<ResModel<void>> postLike({
    required int essayId,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.post(
      '/essay/$essayId/like',
      queryParameters: {
        'user_id': (AuthBlocSingleton.bloc.state as AuthAuthState).user.userId,
      },
    );

    var resModel = ResModel<void>.fromJson(
      res.data,
      (json) {},
    );

    return resModel;
  }

  @override
  Future<ResModel<void>> deleteLike({
    required int essayId,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.delete(
      '/essay/$essayId/like',
      queryParameters: {
        'user_id': (AuthBlocSingleton.bloc.state as AuthAuthState).user.userId,
      },
    );

    var resModel = ResModel<void>.fromJson(
      res.data,
      (json) {},
    );

    return resModel;
  }
}
