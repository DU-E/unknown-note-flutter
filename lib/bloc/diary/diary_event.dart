import 'package:unknown_note_flutter/enums/enum_emotion.dart';

abstract class DiaryEvent {}

class DiaryChangeEmotion extends DiaryEvent {
  final EEmotion emotion;

  DiaryChangeEmotion({
    required this.emotion,
  });
}

class DiaryGet extends DiaryEvent {}
