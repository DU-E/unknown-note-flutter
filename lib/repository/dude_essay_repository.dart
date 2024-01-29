import 'package:dio/dio.dart';
import 'package:unknown_note_flutter/dio/auth_interceptor.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';

class DudeEssayRepository {
  Future<ResModel<List<EssayModel>>> getEssayList({
    required EEssayCategory category,
    required int page,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // var res = await dio.get(
    //   '/essay',
    //   data: {
    //     'category': category.key,
    //     'page': page,
    //   },
    // );

    // TODO; connect api
    await Future.delayed(const Duration(seconds: 1));
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
            nickname: 'woong',
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
  }
}
