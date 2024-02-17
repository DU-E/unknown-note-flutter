import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';

class WriteDiaryState extends Equatable {
  final EUploadStatus status;
  final String? message;

  const WriteDiaryState({
    required this.status,
    this.message,
  });

  const WriteDiaryState.init()
      : status = EUploadStatus.init,
        message = null;

  WriteDiaryState copyWith({
    EUploadStatus? status,
    String? message,
  }) =>
      WriteDiaryState(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
