import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/repository/dude_diary_repository.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  final DudeDiaryRepository dudeDiaryRepository;

  DiaryBloc({
    required this.dudeDiaryRepository,
  }) : super(const DiaryState.init()) {
    on<DiaryChangeEmotion>(_diaryChangeEmotionHandler);
    on<DiaryGet>(_diaryGetHandler);
  }

  Future<void> _diaryChangeEmotionHandler(
    DiaryChangeEmotion event,
    Emitter<DiaryState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading) return;

    emit(state.copyWith(
      status: ELoadingStatus.init,
      emotion: event.emotion,
      page: 0,
    ));

    await _getDiary(emit);
  }

  Future<void> _diaryGetHandler(
    DiaryGet event,
    Emitter<DiaryState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading) return;
    emit(state.copyWith(status: ELoadingStatus.loading));

    await _getDiary(emit);
  }

  Future<void> _getDiary(Emitter<DiaryState> emit) async {
    try {
      var res = await dudeDiaryRepository.getDiary(
        emotion: state.emotion,
        page: state.page + 1,
      );

      emit(state.copyWith(
        status: ELoadingStatus.loaded,
        diary: res,
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
