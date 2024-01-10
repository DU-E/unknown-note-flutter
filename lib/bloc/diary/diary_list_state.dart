import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_diary_category.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';

class DiaryListState extends Equatable {
  final ELoadingStatus status;
  final EDiaryCategory category;
  final String? mood;
  final List<DiaryModel> list;
  final int page;
  final String? message;

  const DiaryListState({
    required this.status,
    required this.category,
    this.mood,
    required this.list,
    required this.page,
    this.message,
  });

  DiaryListState.init()
      : status = ELoadingStatus.init,
        category = EDiaryCategory.recomm,
        mood = null,
        list = [],
        page = 0,
        message = null;

  DiaryListState copyWith({
    ELoadingStatus? status,
    EDiaryCategory? category,
    String? mood,
    List<DiaryModel>? list,
    int? page,
    String? message,
  }) =>
      DiaryListState(
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
