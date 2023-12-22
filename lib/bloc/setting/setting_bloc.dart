import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_event.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_state.dart';

class SettingBloc extends HydratedBloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState.init()) {
    on<SettingZoomIn>(_settingZoomInHandler);
    on<SettingZoomOut>(_settingZoomOutHandler);
  }

  @override
  SettingState? fromJson(Map<String, dynamic> json) =>
      SettingState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(SettingState state) => state.toJson();

  Future<void> _settingZoomInHandler(
    SettingZoomIn event,
    Emitter<SettingState> emit,
  ) async {
    if (!state.isMaxZoom()) {
      emit(state.copyWith(zoom: (state.zoom ?? 2) + 1));
    }
  }

  Future<void> _settingZoomOutHandler(
    SettingZoomOut event,
    Emitter<SettingState> emit,
  ) async {
    if ((state.zoom ?? 2) > 0) {
      emit(state.copyWith(zoom: (state.zoom ?? 2) - 1));
    }
  }
}
