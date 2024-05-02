import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_http_method.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/mixins/dio_exception_handler_mixin.dart';
import 'package:unknown_note_flutter/repository/dude_diary_repository.dart';

class WriteDiaryBloc extends Bloc<WriteDiaryEvent, WriteDiaryState>
    with DioExceptionHandlerMixin {
  final DudeDiaryRepository diaryRepository;
  final EHttpMethod httpMethod;

  WriteDiaryBloc({
    required this.diaryRepository,
    required this.httpMethod,
  }) : super(const WriteDiaryState.init()) {
    on<WriteDiaryUpload>(_writeDiaryUploadHandler);
  }

  Future<void> _writeDiaryUploadHandler(
    WriteDiaryUpload event,
    Emitter<WriteDiaryState> emit,
  ) async {
    // Validation
    if (event.diary.emotion == null) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '감정을 선택해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }

    if (event.diary.content == null || event.diary.content == Strings.nullStr) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '내용을 작성해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }

    emit(state.copyWith(status: ELoadingStatus.loading));
    await handleApiRequest(
      () async {
        switch (httpMethod) {
          case EHttpMethod.post:
            await diaryRepository.postDiary(diary: event.diary);
            break;
          case EHttpMethod.patch:
            await diaryRepository.patchDiary(diary: event.diary);
            break;
        }

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
        ));
      },
      state: state,
      emit: emit,
    );
  }
}
