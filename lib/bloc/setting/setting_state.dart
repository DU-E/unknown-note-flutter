import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

part 'setting_state.g.dart';

@JsonSerializable()
class SettingState extends Equatable {
  final int? zoom;

  const SettingState({
    this.zoom,
  });

  const SettingState.init() : zoom = 2;

  SettingState copyWith({
    int? zoom,
  }) =>
      SettingState(
        zoom: zoom ?? this.zoom,
      );

  factory SettingState.fromJson(Map<String, dynamic> json) =>
      _$SettingStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingStateToJson(this);

  static final zoomLevels = [
    Sizes.size10,
    Sizes.size12,
    Sizes.size14,
    Sizes.size16,
    Sizes.size20,
  ];

  double getZoom() {
    return zoomLevels[zoom ?? 2];
  }

  bool isMaxZoom() {
    return zoomLevels.length - 1 <= (zoom ?? 2);
  }

  @override
  List<Object?> get props => [zoom];
}
