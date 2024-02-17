import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_state.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';

class WriteDiaryBloc extends Bloc<WriteDiaryEvent, WriteDiaryState> {
  // TODO; upload repository

  WriteDiaryBloc() : super(const WriteDiaryState.init()) {
    on<WriteDiaryUpload>(_writeDiaryUploadHandler);
  }

  Future<void> _writeDiaryUploadHandler(
    WriteDiaryUpload event,
    Emitter<WriteDiaryState> emit,
  ) async {
    print(event.diary);

    emit(state.copyWith(status: EUploadStatus.tagging));
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: EUploadStatus.uploading));
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      status: EUploadStatus.success,
    ));
  }
}
