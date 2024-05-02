import 'package:unknown_note_flutter/bloc/abs_bloc_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';

class WriteDiaryState extends BlocState {
  const WriteDiaryState({
    required super.status,
    super.message,
  });

  const WriteDiaryState.init()
      : super(
          status: ELoadingStatus.init,
        );

  @override
  WriteDiaryState copyWith({
    ELoadingStatus? status,
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
