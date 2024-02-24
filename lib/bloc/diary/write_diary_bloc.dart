import 'package:dio/dio.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/dude_diary_repository.dart';

class WriteDiaryBloc extends Bloc<WriteDiaryEvent, WriteDiaryState> {
  final DudeDiaryRepository diaryRepository;

  WriteDiaryBloc({
    required this.diaryRepository,
  }) : super(const WriteDiaryState.init()) {
    on<WriteDiaryUpload>(_writeDiaryUploadHandler);
  }

  Future<void> _writeDiaryUploadHandler(
    WriteDiaryUpload event,
    Emitter<WriteDiaryState> emit,
  ) async {
    try {
      // Validation
      if (event.diary.emotion == null) {
        emit(state.copyWith(
          status: EUploadStatus.error,
          message: '감정을 선택해주세요.',
        ));
        emit(state.copyWith(status: EUploadStatus.init));
        return;
      }

      if (event.diary.content == null ||
          event.diary.content == Strings.nullStr) {
        emit(state.copyWith(
          status: EUploadStatus.error,
          message: '내용을 작성해주세요.',
        ));
        emit(state.copyWith(status: EUploadStatus.init));
        return;
      }

      // Upload
      emit(state.copyWith(status: EUploadStatus.uploading));

      var res = await diaryRepository.postDiary(
        diary: event.diary,
      );

      if (res.code == 1000) {
        emit(state.copyWith(
          status: EUploadStatus.success,
        ));
      } else {
        throw Exception(res.message);
      }
    } on DioException catch (e) {
      var error = e.error as ResModel<void>;
      emit(state.copyWith(
        status: EUploadStatus.error,
        message: '[${error.code}] ${error.message as String}',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: EUploadStatus.error,
        message: '[5001] ${e.toString()}',
      ));
    }
  }
}
