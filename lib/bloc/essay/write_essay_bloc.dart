import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_event.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_state.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';

class WriteEssayBloc extends Bloc<WriteEssayEvent, WriteEssayState> {
  // TODO; upload repository

  WriteEssayBloc() : super(const WriteEssayState.init()) {
    on<WriteEssayUpload>(_writeEssayUploadHandler);
  }

  Future<void> _writeEssayUploadHandler(
    WriteEssayUpload event,
    Emitter<WriteEssayState> emit,
  ) async {
    print(event.essay);

    emit(state.copyWith(status: EUploadStatus.tagging));
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: EUploadStatus.uploading));
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      status: EUploadStatus.success,
    ));
  }
}
