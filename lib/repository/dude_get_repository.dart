import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
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
        author: '#$i',
        body: '${page * 10 + i} ${category.title} essay',
        tags: [category.title, '$page', '$i'],
      ));
    }

    return res;
  }
}
