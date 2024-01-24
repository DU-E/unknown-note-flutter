import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';

class DiaryState extends Equatable {
  final ELoadingStatus status;
  final EEmotion emotion;
  final DiaryModel? diary;
  final int page;
  final String? message;

  const DiaryState({
    required this.status,
    required this.emotion,
    this.diary,
    required this.page,
    this.message,
  });

  const DiaryState.init()
      : status = ELoadingStatus.init,
        emotion = EEmotion.happy,
        diary = null,
        page = 0,
        message = null;

  DiaryState copyWith({
    ELoadingStatus? status,
    EEmotion? emotion,
    DiaryModel? diary,
    int? page,
    String? message,
  }) =>
      DiaryState(
        status: status ?? this.status,
        emotion: emotion ?? this.emotion,
        diary: diary ?? diary,
        page: page ?? this.page,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        emotion,
        diary,
        page,
        message,
      ];
}
