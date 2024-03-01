import 'package:dio/dio.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_event.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/dude_essay_repository.dart';

class WriteEssayBloc extends Bloc<WriteEssayEvent, WriteEssayState> {
  final DudeEssayRepository essayRepository;

  WriteEssayBloc({
    required this.essayRepository,
  }) : super(const WriteEssayState.init()) {
    on<WriteEssayUpload>(_writeEssayUploadHandler);
  }

  Future<void> _writeEssayUploadHandler(
    WriteEssayUpload event,
    Emitter<WriteEssayState> emit,
  ) async {
    try {
      // Validation
      if (event.essay.category == null) {
        emit(state.copyWith(
          status: EUploadStatus.error,
          message: '카테고리를 선택해주세요.',
        ));
        emit(state.copyWith(status: EUploadStatus.init));
        return;
      }

      if (event.essay.title == null || event.essay.title == Strings.nullStr) {
        emit(state.copyWith(
          status: EUploadStatus.error,
          message: '제목을 작성해주세요.',
        ));
        emit(state.copyWith(status: EUploadStatus.init));
        return;
      }

      if (event.essay.content == null ||
          event.essay.content == Strings.nullStr) {
        emit(state.copyWith(
          status: EUploadStatus.error,
          message: '내용을 작성해주세요.',
        ));
        emit(state.copyWith(status: EUploadStatus.init));
        return;
      }

      // Upload
      emit(state.copyWith(status: EUploadStatus.uploading));

      var res = await essayRepository.postEssay(
        essay: event.essay,
      );

      if (res.data != null) {
        emit(state.copyWith(
          status: EUploadStatus.success,
          result: res.data,
        ));
      } else {
        throw Exception('저장된 에세이 수신에 실패했습니다.');
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
