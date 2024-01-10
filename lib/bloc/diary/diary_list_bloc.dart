import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_list_event.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_list_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/repository/dude_get_repository.dart';

class DiaryListBloc extends Bloc<DiaryListEvent, DiaryListState> {
  final DudeGetRepository dudeGetRepository;

  DiaryListBloc({
    required this.dudeGetRepository,
  }) : super(DiaryListState.init()) {
    on<DiaryListChangeCategory>(_diaryListChangeCategoryHandler);
    on<DiaryListLoadMore>(_diaryListLoadMoreHandler);
  }

  Future<void> _diaryListChangeCategoryHandler(
    DiaryListChangeCategory event,
    Emitter<DiaryListState> emit,
  ) async {
    emit(state.copyWith(
      status: ELoadingStatus.init,
      category: event.category,
      list: [],
      page: 0,
    ));
  }

  Future<void> _diaryListLoadMoreHandler(
    DiaryListLoadMore event,
    Emitter<DiaryListState> emit,
  ) async {
    emit(state.copyWith(status: ELoadingStatus.loading));

    try {
      var res = await dudeGetRepository.getDiaryList(
        category: state.category,
        page: state.page + 1,
      );

      List<DiaryModel> newList = [];
      newList
        ..addAll(state.list)
        ..addAll(res);

      emit(state.copyWith(
        status: ELoadingStatus.loaded,
        list: newList,
        page: state.page + 1,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: e.toString(),
      ));
    }
  }
}
