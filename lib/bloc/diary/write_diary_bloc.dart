import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_state.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';

class WriteDiaryBloc extends HydratedBloc<WriteDiaryEvent, WriteDiaryState> {
  // TODO; upload repository

  WriteDiaryBloc() : super(const WriteDiaryState.init()) {
    on<WriteDiarySetContent>(_writeDiarySetContentHandler);
    on<WriteDiaryUpload>(_writeDiaryUploadHandler);
  }

  @override
  WriteDiaryState? fromJson(Map<String, dynamic> json) =>
      WriteDiaryState.fromJson(json).copyWith(
        status: EUploadStatus.init,
      );

  @override
  Map<String, dynamic>? toJson(WriteDiaryState state) => state.toJson();

  Future<void> _writeDiarySetContentHandler(
    WriteDiarySetContent event,
    Emitter<WriteDiaryState> emit,
  ) async {
    emit(state.copyWith(
      diary: state.diary.copyWith(
        content: event.content,
      ),
    ));
  }

  Future<void> _writeDiaryUploadHandler(
    WriteDiaryUpload event,
    Emitter<WriteDiaryState> emit,
  ) async {
    emit(state.copyWith(status: EUploadStatus.tagging));
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: EUploadStatus.uploading));
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      status: EUploadStatus.success,
      diary: const DiaryModel(),
    ));
  }
}
