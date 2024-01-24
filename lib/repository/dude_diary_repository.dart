import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';

class DudeDiaryRepository {
  Future<DiaryModel> getDiary({
    required EEmotion emotion,
    required int page,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    // TODO; connect api
    var res = DiaryModel(
      id: page,
      content: '$page ${emotion.text} diary',
      isOpen: true,
      emotion: EEmotion.normal,
      time: DateTime(2023, 12, 21, 13, 09).add(Duration(minutes: page)),
      userId: page,
    );

    return res;
  }
}
