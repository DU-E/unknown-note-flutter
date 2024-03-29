import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_event.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_state.dart';
import 'package:unknown_note_flutter/enums/enum_upload_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class WriteEssayBloc extends HydratedBloc<WriteEssayEvent, WriteEssayState> {
  // TODO; upload repository

  WriteEssayBloc() : super(WriteEssayState.init()) {
    on<WriteEssaySetTitle>(_writeEssaySetTitleHandler);
    on<WriteEssaySetContent>(_writeEssaySetContentHandler);
    on<WriteEssayUpload>(_writeEssayUploadHandler);
  }

  @override
  WriteEssayState? fromJson(Map<String, dynamic> json) =>
      WriteEssayState.fromJson(json).copyWith(
        status: EUploadStatus.init,
      );

  @override
  Map<String, dynamic>? toJson(WriteEssayState state) => state.toJson();

  Future<void> _writeEssaySetTitleHandler(
    WriteEssaySetTitle event,
    Emitter<WriteEssayState> emit,
  ) async {
    emit(state.copyWith(
      essay: state.essay.copyWith(
        title: event.title,
      ),
    ));
  }

  Future<void> _writeEssaySetContentHandler(
    WriteEssaySetContent event,
    Emitter<WriteEssayState> emit,
  ) async {
    emit(state.copyWith(
      essay: state.essay.copyWith(
        content: event.content,
      ),
    ));
  }

  Future<void> _writeEssayUploadHandler(
    WriteEssayUpload event,
    Emitter<WriteEssayState> emit,
  ) async {
    emit(state.copyWith(status: EUploadStatus.tagging));
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: EUploadStatus.uploading));
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      status: EUploadStatus.success,
      essay: EssayModel(),
    ));
  }
}
