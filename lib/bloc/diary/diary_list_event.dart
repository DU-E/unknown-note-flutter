import 'package:unknown_note_flutter/enums/enum_diary_category.dart';

abstract class DiaryListEvent {}

class DiaryListChangeCategory extends DiaryListEvent {
  final EDiaryCategory category;

  DiaryListChangeCategory({
    required this.category,
  });
}

class DiaryListLoadMore extends DiaryListEvent {}
