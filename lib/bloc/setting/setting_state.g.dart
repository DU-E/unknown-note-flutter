// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingState _$SettingStateFromJson(Map<String, dynamic> json) => SettingState(
      zoom: json['zoom'] as int?,
      font: $enumDecodeNullable(_$EFontEnumMap, json['font']),
    );

Map<String, dynamic> _$SettingStateToJson(SettingState instance) =>
    <String, dynamic>{
      'zoom': instance.zoom,
      'font': _$EFontEnumMap[instance.font],
    };

const _$EFontEnumMap = {
  EFont.roboto: 'roboto',
  EFont.pretendard: 'pretendard',
  EFont.nanumMyeongjo: 'nanumMyeongjo',
  EFont.cafe24Dongdong: 'cafe24Dongdong',
  EFont.poorStory: 'poorStory',
  EFont.cuteFont: 'cuteFont',
};
