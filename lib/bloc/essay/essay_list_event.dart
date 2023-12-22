import 'package:unknown_note_flutter/enums/enum_essay_category.dart';

abstract class EssayListEvent {}

class EssayListChangeCategory extends EssayListEvent {
  final EEssayCategory category;

  EssayListChangeCategory({
    required this.category,
  });
}

class EssayListLoadMore extends EssayListEvent {}
