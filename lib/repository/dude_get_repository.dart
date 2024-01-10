import 'package:unknown_note_flutter/enums/enum_diary_category.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class DudeGetRepository {
  Future<List<EssayModel>> getEssayList({
    required EEssayCategory category,
    required int page,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    // TODO; connect api
    List<EssayModel> res = [];
    for (int i = 0; i < 10; i++) {
      res.add(EssayModel(
        id: page * 10 + i,
        author: '@$i',
        title: '$i\'s ${page * 10 + i}th essay',
        body: '${page * 10 + i} ${category.title} essay',
        likes: 10000,
        tags: [category.title, '$page', '$i'],
        date: DateTime(2023, 12, 21, 13, 09)
            .add(Duration(minutes: page * 10 + i)),
      ));
    }

    return res;
  }

  Future<List<DiaryModel>> getDiaryList({
    required EDiaryCategory category,
    required int page,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    // TODO; connect api
    List<DiaryModel> res = [];
    for (int i = 0; i < 10; i++) {
      res.add(DiaryModel(
        id: page * 10 + i,
        author: '@$i',
        title: '$i\'s ${page * 10 + i}th diary',
        body: '${page * 10 + i} ${category.title} diary',
        likes: 10000,
        tags: [category.title, '$page', '$i'],
        date: DateTime(2023, 12, 21, 13, 09)
            .add(Duration(minutes: page * 10 + i)),
      ));
    }

    return res;
  }
}
