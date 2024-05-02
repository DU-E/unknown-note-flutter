import 'package:unknown_note_flutter/bloc/abs_bloc_state.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class EssayListState extends BlocState {
  final EEssayCategory category;
  final String? mood;
  final List<EssayModel> list;
  final int page;

  const EssayListState({
    required this.category,
    this.mood,
    required this.list,
    required this.page,
    required super.status,
    super.message,
  });

  const EssayListState.init()
      : category = EEssayCategory.poem,
        mood = null,
        list = const [],
        page = 0,
        super(
          status: ELoadingStatus.init,
        );

  @override
  EssayListState copyWith({
    EEssayCategory? category,
    String? mood,
    List<EssayModel>? list,
    int? page,
    ELoadingStatus? status,
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
