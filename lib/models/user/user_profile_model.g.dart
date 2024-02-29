// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      essayCount: json['essay_cnt'] as int?,
      diaryCount: json['journal_cnt'] as int?,
      recentGraph: (json['recent_graph'] as List<dynamic>?)
          ?.map((e) => UserStatsDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      monthlyAct: (json['monthly_act'] as List<dynamic>?)
          ?.map((e) => UserStatsDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      monthlyEmotions: json['monthly_emo'] == null
          ? null
          : UserMonthlyEmotionModel.fromJson(
              json['monthly_emo'] as Map<String, dynamic>),
      flower: $enumDecodeNullable(_$EEmotionEnumMap, json['flower']),
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'essay_cnt': instance.essayCount,
      'journal_cnt': instance.diaryCount,
      'recent_graph': instance.recentGraph?.map((e) => e.toJson()).toList(),
      'monthly_act': instance.monthlyAct?.map((e) => e.toJson()).toList(),
      'monthly_emo': instance.monthlyEmotions?.toJson(),
      'flower': _$EEmotionEnumMap[instance.flower],
    };

const _$EEmotionEnumMap = {
  EEmotion.happy: 'happy',
  EEmotion.love: 'love',
  EEmotion.expect: 'expect',
  EEmotion.thanks: 'thanks',
  EEmotion.sad: 'sad',
  EEmotion.anger: 'anger',
  EEmotion.fear: 'fear',
  EEmotion.regret: 'regret',
};

_$UserStatsDataModelImpl _$$UserStatsDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserStatsDataModelImpl(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      value: json['value'] as num?,
    );

Map<String, dynamic> _$$UserStatsDataModelImplToJson(
        _$UserStatsDataModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'value': instance.value,
    };

_$UserMonthlyEmotionModelImpl _$$UserMonthlyEmotionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserMonthlyEmotionModelImpl(
      happy: json['happy'] as int?,
      love: json['love'] as int?,
      expect: json['expect'] as int?,
      thanks: json['thanks'] as int?,
      sad: json['sad'] as int?,
      anger: json['anger'] as int?,
      fear: json['fear'] as int?,
      regret: json['regret'] as int?,
    );

Map<String, dynamic> _$$UserMonthlyEmotionModelImplToJson(
        _$UserMonthlyEmotionModelImpl instance) =>
    <String, dynamic>{
      'happy': instance.happy,
      'love': instance.love,
      'expect': instance.expect,
      'thanks': instance.thanks,
      'sad': instance.sad,
      'anger': instance.anger,
      'fear': instance.fear,
      'regret': instance.regret,
    };
