import 'package:unknown_note_flutter/bloc/abs_bloc_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class UserEssayState extends BlocState {
  final List<EssayModel> list;
  final int page;

  const UserEssayState({
    required this.list,
    required this.page,
    required super.status,
    super.message,
  });

  const UserEssayState.init()
      : list = const [],
        page = 0,
        super(
          status: ELoadingStatus.init,
        );

  @override
  UserEssayState copyWith({
    List<EssayModel>? list,
    int? page,
    ELoadingStatus? status,
    String? message,
  }) =>
      UserEssayState(
        list: list ?? this.list,
        page: page ?? this.page,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        list,
        page,
        status,
        message,
      ];
}
