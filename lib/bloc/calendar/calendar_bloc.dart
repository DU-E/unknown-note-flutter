import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_event.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/interface/interface_dude_diary_repository.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final IDudeDiaryRepository dudeDiaryRepository;

  CalendarBloc({
    required this.dudeDiaryRepository,
  }) : super(CalendarState()) {
    on<CalendarLoadEvent>(_calendarLoadEventHandler);
  }

  Future<void> _calendarLoadEventHandler(
    CalendarLoadEvent event,
    Emitter<CalendarState> emit,
  ) async {
    var page = DateTime(event.page.year, event.page.month, 1);
    if (state.status?[page] == ELoadingStatus.loaded ||
        state.status?[page] == ELoadingStatus.loading) return;

    try {
      emit(
        state.copyWith(
          status: Map<DateTime, ELoadingStatus>.from(state.status ?? {})
            ..addAll({
              page: ELoadingStatus.loading,
            }),
        ),
      );

      var res = await dudeDiaryRepository.getDiaryCal(
        year: event.page.year,
        month: event.page.month,
      );

      var pageRes = CalendarMonthModel(
        diaries: {
          for (var diary in res.data ?? [])
            DateTime(
              diary.time!.year,
              diary.time!.month,
              diary.time!.day,
            ): diary
        },
      );

      emit(
        state.copyWith(
          status: Map<DateTime, ELoadingStatus>.from(state.status ?? {})
            ..addAll({
              page: ELoadingStatus.loaded,
            }),
          page: Map<DateTime, CalendarMonthModel>.from(state.page ?? {})
            ..addAll({
              page: pageRes,
            }),
        ),
      );
    } on DioException catch (e) {
      var error = e.error as ResModel<void>;
      emit(
        state.copyWith(
          status: Map<DateTime, ELoadingStatus>.from(state.status ?? {})
            ..addAll({
              page: ELoadingStatus.error,
            }),
          message: Map<DateTime, String>.from(state.message ?? {})
            ..addAll({
              page: '[${error.code}] ${error.message as String}',
            }),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: Map<DateTime, ELoadingStatus>.from(state.status ?? {})
            ..addAll({
              page: ELoadingStatus.error,
            }),
          message: Map<DateTime, String>.from(state.message ?? {})
            ..addAll({
              page: '[5001] ${e.toString()}',
            }),
        ),
      );
    }
  }
}
