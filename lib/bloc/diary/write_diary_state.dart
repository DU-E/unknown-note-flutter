import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';

part 'write_diary_state.g.dart';

@JsonSerializable(explicitToJson: true)
class WriteDiaryState extends Equatable {
  final EUploadStatus status;
  final DiaryModel diary;
  final String? message;

  const WriteDiaryState({
    required this.status,
    required this.diary,
    this.message,
  });

  WriteDiaryState.init()
      : status = EUploadStatus.init,
        diary = DiaryModel(),
        message = null;

  WriteDiaryState copyWith({
    EUploadStatus? status,
    DiaryModel? diary,
    String? message,
  }) =>
      WriteDiaryState(
        status: status ?? this.status,
        diary: diary ?? this.diary,
        message: message ?? this.message,
      );

  factory WriteDiaryState.fromJson(Map<String, dynamic> json) =>
      _$WriteDiaryStateFromJson(json);

  Map<String, dynamic> toJson() => _$WriteDiaryStateToJson(this);

  @override
  List<Object?> get props => [
        status,
        diary,
        message,
      ];
}
