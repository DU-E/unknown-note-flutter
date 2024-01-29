import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_event.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/dude_essay_repository.dart';

class EssayListBloc extends Bloc<EssayListEvent, EssayListState> {
  final DudeEssayRepository dudeEssayRepository;

  EssayListBloc({
    required this.dudeEssayRepository,
  }) : super(EssayListState.init()) {
    on<EssayListChangeCategory>(_essayListChangeCategoryHandler);
    on<EssayListLoadMore>(_essayListLoadMoreHandler);
    on<EssayListRetry>(_essayListRetryHandler);
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
      var res = await dudeEssayRepository.getEssayList(
        category: state.category,
        page: state.page + 1,
      );

      List<EssayModel> newList = [];
      newList
        ..addAll(state.list)
        ..addAll(res.data ?? []);

      emit(state.copyWith(
        status: ELoadingStatus.loaded,
        list: newList,
        page: state.page + 1,
      ));
    } on DioException catch (e) {
      var error = e.error as ResModel<void>;
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '[${error.code}] ${error.message as String}',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '[5001] ${e.toString()}',
      ));
    }
  }

  Future<void> _essayListRetryHandler(
    EssayListRetry event,
    Emitter<EssayListState> emit,
  ) async {
    emit(state.copyWith(
      status: ELoadingStatus.init,
    ));
  }
}
