import 'package:unknown_note_flutter/bloc/abs_bloc_state.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';

class DiaryState extends BlocState {
  final EEmotion emotion;
  final DiaryModel? diary;
  final int page;

  const DiaryState({
    required this.emotion,
    this.diary,
    required this.page,
    required super.status,
    super.message,
  });

  const DiaryState.init()
      : emotion = EEmotion.happy,
        diary = null,
        page = 0,
        super(
          status: ELoadingStatus.init,
        );

  @override
  DiaryState copyWith({
    EEmotion? emotion,
    DiaryModel? diary,
    int? page,
    ELoadingStatus? status,
    String? message,
  }) =>
      DiaryState(
        emotion: emotion ?? this.emotion,
        diary: diary ?? diary,
        page: page ?? this.page,
        status: status ?? this.status,
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
