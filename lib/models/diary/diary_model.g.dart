// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiaryModelImpl _$$DiaryModelImplFromJson(Map<String, dynamic> json) =>
    _$DiaryModelImpl(
      id: json['diaryid'] as int?,
      content: json['dcontent'] as String?,
      time: json['dtime'] == null
          ? null
          : DateTime.parse(json['dtime'] as String),
      emotion: $enumDecodeNullable(_$EEmotionEnumMap, json['dtag']),
      userId: json['userid'] as int?,
      isOpen: openableFromJson(json['openable'] as int?),
    );

Map<String, dynamic> _$$DiaryModelImplToJson(_$DiaryModelImpl instance) =>
    <String, dynamic>{
      'diaryid': instance.id,
      'dcontent': instance.content,
      'dtime': instance.time?.toIso8601String(),
      'dtag': _$EEmotionEnumMap[instance.emotion],
      'userid': instance.userId,
      'openable': openableToJson(instance.isOpen),
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
