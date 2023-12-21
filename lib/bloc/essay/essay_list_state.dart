import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class EssayListState extends Equatable {
  final ELoadingStatus status;
  final EEssayCategory category;
  final String? mood;
  final List<EssayModel> list;
  final int page;
  final String? message;

  const EssayListState({
    required this.status,
    required this.category,
    this.mood,
    required this.list,
    required this.page,
    this.message,
  });

  EssayListState.init()
      : status = ELoadingStatus.init,
        category = EEssayCategory.recomm,
        mood = null,
        list = [],
        page = 0,
        message = null;

  EssayListState copyWith({
    ELoadingStatus? status,
    EEssayCategory? category,
    String? mood,
    List<EssayModel>? list,
    int? page,
    String? message,
  }) =>
      EssayListState(
        status: status ?? this.status,
        category: category ?? this.category,
        mood: mood ?? this.mood,
        list: list ?? this.list,
        page: page ?? this.page,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        category,
        mood,
        list,
        page,
        message,
      ];
}
