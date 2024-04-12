import 'package:unknown_note_flutter/models/diary/diary_model.dart';

abstract class WriteDiaryEvent {}

class WriteDiaryUpload extends WriteDiaryEvent {
  DiaryModel diary;

  WriteDiaryUpload(this.diary);
}
