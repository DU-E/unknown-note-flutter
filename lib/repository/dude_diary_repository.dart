import 'package:dio/dio.dart';
import 'package:unknown_note_flutter/dio/auth_interceptor.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/interface/interface_dude_diary_repository.dart';

class DudeDiaryRepository implements IDudeDiaryRepository {
  @override
  Future<ResModel<DiaryModel>> getDiary({
    required EEmotion emotion,
    required int page,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.get(
      '/diary',
      queryParameters: {
        'emotion': emotion.key,
      },
    );

    var resModel = ResModel<DiaryModel>.fromJson(
      res.data,
      (json) => DiaryModel.fromJson(json),
    );

    return resModel;
  }

  @override
  Future<ResModel<List<DiaryModel>>> getDiaryCal({
    required int year,
    required int month,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.get(
      '/diary/cal',
      queryParameters: {
        'year': year,
        'month': month,
      },
    );

    var resModel = ResModel<List<DiaryModel>>.fromJson(
      res.data,
      (json) => (json as List<dynamic>)
          .map((diary) => DiaryModel.fromJson(diary))
          .toList(),
    );

    return resModel;
  }

  @override
  Future<ResModel<void>> postDiary({
    required DiaryModel diary,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.post(
      '/diary',
      data: diary.toJson(),
    );

    var resModel = ResModel<void>.fromJson(
      res.data,
      (json) {},
    );

    return resModel;
  }

  @override
  Future<ResModel<void>> patchDiary({
    required DiaryModel diary,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    var res = await dio.patch(
      '/diary',
      data: diary.toJson(),
    );

    var resModel = ResModel<void>.fromJson(
      res.data,
      (json) {},
    );

    return resModel;
  }
}
