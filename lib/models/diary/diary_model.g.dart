// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryModel _$DiaryModelFromJson(Map<String, dynamic> json) => DiaryModel(
      id: json['id'] as int?,
      content: json['content'] as String?,
      emotion: $enumDecodeNullable(_$EEmotionEnumMap, json['emotion']),
      isOpen: json['isOpen'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DiaryModelToJson(DiaryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'emotion': _$EEmotionEnumMap[instance.emotion],
      'isOpen': instance.isOpen,
      'tags': instance.tags,
      'date': instance.date?.toIso8601String(),
    };

const _$EEmotionEnumMap = {
  EEmotion.normal: 'normal',
  EEmotion.happy: 'happy',
  EEmotion.love: 'love',
  EEmotion.anticipation: 'anticipation',
  EEmotion.thank: 'thank',
  EEmotion.sad: 'sad',
  EEmotion.rage: 'rage',
  EEmotion.fear: 'fear',
  EEmotion.regret: 'regret',
};
