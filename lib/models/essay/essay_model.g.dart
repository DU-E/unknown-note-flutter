// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'essay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EssayModelImpl _$$EssayModelImplFromJson(Map<String, dynamic> json) =>
    _$EssayModelImpl(
      id: json['essayid'] as int?,
      title: json['etitle'] as String?,
      content: json['econtent'] as String?,
      time: json['etime'] == null
          ? null
          : DateTime.parse(json['etime'] as String),
      likes: json['elikes'] as int?,
      category: $enumDecodeNullable(_$EEssayCategoryEnumMap, json['ecategory']),
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$$EssayModelImplToJson(_$EssayModelImpl instance) =>
    <String, dynamic>{
      'essayid': instance.id,
      'etitle': instance.title,
      'econtent': instance.content,
      'etime': instance.time?.toIso8601String(),
      'elikes': instance.likes,
      'ecategory': _$EEssayCategoryEnumMap[instance.category],
      'nickname': instance.nickname,
    };

const _$EEssayCategoryEnumMap = {
  EEssayCategory.poem: 'poem',
  EEssayCategory.novel: 'novel',
  EEssayCategory.whisper: 'whisper',
  EEssayCategory.subs: 'subs',
  EEssayCategory.favs: 'favs',
};
