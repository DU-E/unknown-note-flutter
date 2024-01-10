import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diary_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DiaryModel extends Equatable {
  final int? id;
  final String? author;
  final String? title;
  final String? body;
  final int? likes;
  final List<String>? tags;
  final DateTime? date;

  const DiaryModel({
    this.id,
    this.author,
    this.title,
    this.body,
    this.likes,
    this.tags,
    this.date,
  });

  DiaryModel copyWith({
    int? id,
    String? author,
    String? title,
    String? body,
    int? likes,
    List<String>? tags,
    DateTime? date,
  }) =>
      DiaryModel(
        id: id ?? this.id,
        author: author ?? this.author,
        title: title ?? this.title,
        body: body ?? this.body,
        likes: likes ?? this.likes,
        tags: tags ?? this.tags,
        date: date ?? this.date,
      );

  factory DiaryModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        author,
        title,
        body,
        likes,
        tags,
        date,
      ];
}
