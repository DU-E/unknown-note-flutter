// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write_diary_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WriteDiaryState _$WriteDiaryStateFromJson(Map<String, dynamic> json) =>
    WriteDiaryState(
      status: $enumDecode(_$EUploadStatusEnumMap, json['status']),
      diary: DiaryModel.fromJson(json['diary'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$WriteDiaryStateToJson(WriteDiaryState instance) =>
    <String, dynamic>{
      'status': _$EUploadStatusEnumMap[instance.status]!,
      'diary': instance.diary.toJson(),
      'message': instance.message,
    };

const _$EUploadStatusEnumMap = {
  EUploadStatus.init: 'init',
  EUploadStatus.tagging: 'tagging',
  EUploadStatus.uploading: 'uploading',
  EUploadStatus.success: 'success',
  EUploadStatus.error: 'error',
};
