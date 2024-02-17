import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';

class WriteEssayState extends Equatable {
  final EUploadStatus status;
  final String? message;

  const WriteEssayState({
    required this.status,
    this.message,
  });

  const WriteEssayState.init()
      : status = EUploadStatus.init,
        message = null;

  WriteEssayState copyWith({
    EUploadStatus? status,
    String? message,
  }) =>
      WriteEssayState(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
