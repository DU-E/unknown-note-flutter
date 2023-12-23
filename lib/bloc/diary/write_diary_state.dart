import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

part 'write_diary_state.g.dart';

@JsonSerializable(explicitToJson: true)
class WriteEssayState extends Equatable {
  final EUploadStatus status;
  final EssayModel essay;
  final String? message;

  const WriteEssayState({
    required this.status,
    required this.essay,
    this.message,
  });

  const WriteEssayState.init()
      : status = EUploadStatus.init,
        essay = const EssayModel(),
        message = null;

  WriteEssayState copyWith({
    EUploadStatus? status,
    EssayModel? essay,
    String? message,
  }) =>
      WriteEssayState(
        status: status ?? this.status,
        essay: essay ?? this.essay,
        message: message ?? this.message,
      );

  factory WriteEssayState.fromJson(Map<String, dynamic> json) =>
      _$WriteEssayStateFromJson(json);

  Map<String, dynamic> toJson() => _$WriteEssayStateToJson(this);

  @override
  List<Object?> get props => [
        status,
        essay,
        message,
      ];
}
