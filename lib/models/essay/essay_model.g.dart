// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'essay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EssayModel _$EssayModelFromJson(Map<String, dynamic> json) => EssayModel(
      id: json['id'] as int?,
      author: json['author'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      likes: json['likes'] as int?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EssayModelToJson(EssayModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'title': instance.title,
      'body': instance.body,
      'likes': instance.likes,
      'tags': instance.tags,
    };
