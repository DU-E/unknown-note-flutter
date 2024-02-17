import 'package:unknown_note_flutter/models/essay/essay_model.dart';

abstract class WriteEssayEvent {}

class WriteEssayUpload extends WriteEssayEvent {
  EssayModel essay;

  WriteEssayUpload(this.essay);
}
