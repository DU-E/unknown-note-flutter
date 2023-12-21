import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_event.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/repository/dude_get_repository.dart';

class EssayListBloc extends Bloc<EssayListEvent, EssayListState> {
  final DudeGetRepository dudeGetRepository;

  EssayListBloc({
    required this.dudeGetRepository,
  }) : super(EssayListState.init()) {
    on<EssayListChangeCategory>(_essayListChangeCategoryHandler);
    on<EssayListLoadMore>(_essayListLoadMoreHandler);
  }

  Future<void> _essayListChangeCategoryHandler(
    EssayListChangeCategory event,
    Emitter<EssayListState> emit,
  ) async {
    emit(state.copyWith(
      status: ELoadingStatus.init,
      category: event.category,
      list: [],
      page: 0,
    ));
  }

  Future<void> _essayListLoadMoreHandler(
    EssayListLoadMore event,
    Emitter<EssayListState> emit,
  ) async {
    emit(state.copyWith(status: ELoadingStatus.loading));

    try {
      var res = await dudeGetRepository.getEssayList(
        category: state.category,
        page: state.page + 1,
      );

      List<EssayModel> newList = [];
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
