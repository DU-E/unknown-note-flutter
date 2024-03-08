import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class UserEssayState extends Equatable {
  final ELoadingStatus status;
  final List<EssayModel> list;
  final int page;
  final String? message;

  const UserEssayState({
    required this.status,
    required this.list,
    required this.page,
    this.message,
  });

  UserEssayState.init()
      : status = ELoadingStatus.init,
        list = [],
        page = 0,
        message = null;

  UserEssayState copyWith({
    ELoadingStatus? status,
    List<EssayModel>? list,
    int? page,
    String? message,
  }) =>
      UserEssayState(
        status: status ?? this.status,
        list: list ?? this.list,
        page: page ?? this.page,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        list,
        page,
        message,
      ];
}
