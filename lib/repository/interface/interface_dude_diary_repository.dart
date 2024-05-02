import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';

abstract interface class IDudeDiaryRepository {
  Future<ResModel<DiaryModel>> getDiary({
    required EEmotion emotion,
    required int page,
  });

  Future<ResModel<List<DiaryModel>>> getDiaryCal({
    required int year,
    required int month,
  });

  Future<ResModel<void>> postDiary({
    required DiaryModel diary,
  });

  Future<ResModel<void>> patchDiary({
    required DiaryModel diary,
  });
}
