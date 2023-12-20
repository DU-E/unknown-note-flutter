import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class EssayListState extends Equatable {
  final Map<String, ELoadingStatus> status;
  final Map<String, List<EssayModel>> list;
  final Map<String, int> page;
  final Map<String, String> message;

  const EssayListState({
    required this.status,
    required this.list,
    required this.page,
    required this.message,
  });

  EssayListState.init()
      : status = {},
        list = {},
        page = {},
        message = {};

  EssayListState copyWith({
    Map<String, ELoadingStatus>? status,
    Map<String, List<EssayModel>>? list,
    Map<String, int>? page,
    Map<String, String>? message,
  }) =>
      EssayListState(
        status: status ?? this.status,
        list: list ?? this.list,
        page: page ?? this.page,
        message: message ?? this.message,
      );

  EssayListState copyWithStatus({
    required String category,
    required ELoadingStatus status,
  }) {
    var newState = copyWith();
    newState.status[category] = status;
    return EssayListState(
      status: newState.status,
      list: newState.list,
      page: newState.page,
      message: newState.message,
    );
  }

  EssayListState appendList({
    required String category,
    required List<EssayModel> list,
  }) {
    var newState = copyWith();
    if (newState.list[category] == null) {
      newState.list[category] = [];
    }
    newState.list[category]!.addAll(list);
    return EssayListState(
      status: newState.status,
      list: newState.list,
      page: newState.page,
      message: newState.message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        list,
        page,
        message,
      ];
}
