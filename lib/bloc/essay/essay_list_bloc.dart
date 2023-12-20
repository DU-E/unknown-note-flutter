import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_event.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class EssayListBloc extends Bloc<EssayListEvent, EssayListState> {
  EssayListBloc() : super(EssayListState.init()) {
    on<EssayListLoadEvent>(_essayListLoadEventHandler);
  }

  Future<void> _essayListLoadEventHandler(
    EssayListLoadEvent event,
    Emitter<EssayListState> emit,
  ) async {
    emit(state.copyWithStatus(
      category: event.category,
      status: ELoadingStatus.loading,
    ));

    Future.delayed(const Duration(seconds: 1));

    // TODO; connect api
    List<EssayModel> res = [];
    for (int i = 0; i < 10; i++) {
      res.add(EssayModel(
        id: event.page * 10 + i,
        author: '#$i',
        body: '${event.page * 10 + i} ${event.category} essay',
        tags: [event.category, '${event.page}', '$i'],
      ));
    }

    emit(state.appendList(
      category: event.category,
      list: res,
    ));
    emit(state.copyWithStatus(
      category: event.category,
      status: ELoadingStatus.loaded,
    ));
  }
}
