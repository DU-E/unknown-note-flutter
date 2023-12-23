// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write_diary_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WriteEssayState _$WriteEssayStateFromJson(Map<String, dynamic> json) =>
    WriteEssayState(
      status: $enumDecode(_$EUploadStatusEnumMap, json['status']),
      essay: EssayModel.fromJson(json['essay'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$WriteEssayStateToJson(WriteEssayState instance) =>
    <String, dynamic>{
      'status': _$EUploadStatusEnumMap[instance.status]!,
      'essay': instance.essay.toJson(),
      'message': instance.message,
    };

const _$EUploadStatusEnumMap = {
  EUploadStatus.init: 'init',
  EUploadStatus.tagging: 'tagging',
  EUploadStatus.uploading: 'uploading',
  EUploadStatus.success: 'success',
  EUploadStatus.error: 'error',
};
