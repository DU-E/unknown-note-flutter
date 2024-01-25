import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';

part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  factory CalendarState({
    Map<DateTime, CalendarMonthModel>? page,
    Map<DateTime, ELoadingStatus>? status,
    Map<DateTime, String>? message,
  }) = _CalendarState;
}

@freezed
class CalendarMonthModel with _$CalendarMonthModel {
  factory CalendarMonthModel({
    Map<DateTime, DiaryModel>? diaries,
  }) = _CalendarMonthModel;
}
