import 'package:dio/dio.dart';
import 'package:unknown_note_flutter/dio/auth_interceptor.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';

class DudeDiaryRepository {
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
        // 'error': 2000,
      },
      // @deprecated
      // data: {
      //   'page': page,
      // },
    );

    var resModel = ResModel<DiaryModel>.fromJson(
      res.data,
      (json) => DiaryModel.fromJson(json),
    );

    return resModel;
  }

  Future<ResModel<List<DiaryModel>>> getDiaryCal({
    required int year,
    required int month,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // var res = await dio.get(
    //   '/diary/cal',
    //   queryParameters: {
    //     'year': year,
    //     'month': month,
    //   },
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));
    var resTmp = ResModel<List<DiaryModel>>(
      code: 1000,
      data: [
        DiaryModel(
          id: 1,
          content: 'diary 1',
          isOpen: true,
          emotion: EEmotion.happy,
          time: DateTime(year, month, 1, 13, 09),
          userId: 1,
        ),
        DiaryModel(
          id: 2,
          content: 'diary 2',
          isOpen: true,
          emotion: EEmotion.sad,
          time: DateTime(year, month, 9, 13, 09),
          userId: 2,
        ),
        DiaryModel(
          id: 3,
          content: 'diary 3',
          isOpen: true,
          emotion: EEmotion.love,
          time: DateTime(year, month, 21, 13, 09),
          userId: 3,
        ),
      ],
    ).toJson(
      (diaryList) => diaryList.map((diary) => diary.toJson()).toList(),
    );

    var res = ResModel<List<DiaryModel>>.fromJson(
      resTmp,
      (json) => (json as List<dynamic>)
          .map((diary) => DiaryModel.fromJson(diary))
          .toList(),
    );

    return res;
  }

  Future<ResModel<void>> postDiary({
    required DiaryModel diary,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // var res = await dio.post(
    //   '/diary/save',
    //   data: diary.toJson(),
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));
    var resTmp = ResModel<void>(
      code: 1000,
      // message: 'diary saving failed',
    ).toJson((p0) => null);

    var res = ResModel<void>.fromJson(resTmp, (json) {});

    return res;
  }
}
