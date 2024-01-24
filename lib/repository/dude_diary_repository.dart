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
      data: {
        'page': page,
      },
    );

    // toJson Example
    // var json = ResModel<DiaryModel>(
    //   code: 1000,
    //   data: DiaryModel(
    //     id: page,
    //     content: '$page ${emotion.text} diary',
    //     isOpen: true,
    //     emotion: EEmotion.happy,
    //     time: DateTime(2023, 12, 21, 13, 09).add(Duration(minutes: page)),
    //     userId: page,
    //   ),
    // ).toJson(
    //   (diary) => diary.toJson(),
    // );
    // var jsonRes = jsonEncode(json);

    var resModel = ResModel<DiaryModel>.fromJson(
      res.data,
      (json) => DiaryModel.fromJson(json),
    );

    return resModel;
  }
}
