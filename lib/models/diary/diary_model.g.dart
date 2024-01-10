// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryModel _$DiaryModelFromJson(Map<String, dynamic> json) => DiaryModel(
      id: json['id'] as int?,
      author: json['author'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      likes: json['likes'] as int?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DiaryModelToJson(DiaryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'title': instance.title,
      'body': instance.body,
      'likes': instance.likes,
      'tags': instance.tags,
      'date': instance.date?.toIso8601String(),
    };
