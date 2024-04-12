import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class WriteEssayState extends Equatable {
  final EUploadStatus status;
  final EssayModel? result; // API result essay
  final String? message;

  const WriteEssayState({
    required this.status,
    this.result,
    this.message,
  });

  const WriteEssayState.init()
      : status = EUploadStatus.init,
        result = null,
        message = null;

  WriteEssayState copyWith({
    EUploadStatus? status,
    EssayModel? result,
    String? message,
  }) =>
      WriteEssayState(
        status: status ?? this.status,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        result,
        message,
      ];
}
