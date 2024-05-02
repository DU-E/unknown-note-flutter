import 'package:unknown_note_flutter/bloc/abs_bloc_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class WriteEssayState extends BlocState {
  final EssayModel? result; // API result essay

  const WriteEssayState({
    this.result,
    required super.status,
    super.message,
  });

  const WriteEssayState.init()
      : result = null,
        super(
          status: ELoadingStatus.init,
        );

  @override
  WriteEssayState copyWith({
    EssayModel? result,
    ELoadingStatus? status,
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
