import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_event.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_http_method.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/mixins/dio_exception_handler_mixin.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/interface/interface_dude_essay_repository.dart';

class WriteEssayBloc extends Bloc<WriteEssayEvent, WriteEssayState>
    with DioExceptionHandlerMixin {
  final IDudeEssayRepository essayRepository;
  final EHttpMethod httpMethod;

  WriteEssayBloc({
    required this.essayRepository,
    required this.httpMethod,
  }) : super(const WriteEssayState.init()) {
    on<WriteEssayUpload>(_writeEssayUploadHandler);
  }

  Future<void> _writeEssayUploadHandler(
    WriteEssayUpload event,
    Emitter<WriteEssayState> emit,
  ) async {
    // Validation
    if (event.essay.category == null) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '카테고리를 선택해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }

    if (event.essay.title == null || event.essay.title == Strings.nullStr) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '제목을 작성해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }

    if (event.essay.content == null || event.essay.content == Strings.nullStr) {
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
        ResModel<EssayModel>? res;
        switch (httpMethod) {
          case EHttpMethod.post:
            res = await essayRepository.postEssay(essay: event.essay);
            break;
          case EHttpMethod.patch:
            res = await essayRepository.patchEssay(essay: event.essay);
            break;
          default:
            break;
        }

        if (res?.data != null) {
          emit(state.copyWith(
            status: ELoadingStatus.loaded,
            result: res!.data,
          ));
        } else {
          throw Exception('저장된 에세이 수신에 실패했습니다.');
        }
      },
      state: state,
      emit: emit,
    );
  }
}
