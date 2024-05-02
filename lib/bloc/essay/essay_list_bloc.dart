import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_event.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/mixins/dio_exception_handler_mixin.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/repository/interface/interface_dude_essay_repository.dart';

class EssayListBloc extends Bloc<EssayListEvent, EssayListState>
    with DioExceptionHandlerMixin {
  final IDudeEssayRepository dudeEssayRepository;

  EssayListBloc({
    required this.dudeEssayRepository,
  }) : super(const EssayListState.init()) {
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

    await handleApiRequest(
      () async {
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
      },
      state: state,
      emit: emit,
      initAfterError: false,
    );
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
