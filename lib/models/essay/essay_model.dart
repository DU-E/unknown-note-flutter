import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'essay_model.g.dart';

@JsonSerializable()
class EssayModel extends Equatable {
  final int? id;
  final String? author;
  final String? title;
  final String? body;
  final int? likes;
  final List<String>? tags;

  const EssayModel({
    this.id,
    this.author,
    this.title,
    this.body,
    this.likes,
    this.tags,
  });

  EssayModel copyWith({
    int? id,
    String? author,
    String? title,
    String? body,
    int? likes,
    List<String>? tags,
  }) =>
      EssayModel(
        id: id ?? this.id,
        author: author ?? this.author,
        title: title ?? this.title,
        body: body ?? this.body,
        likes: likes ?? this.likes,
        tags: tags ?? this.tags,
      );

  factory EssayModel.fromJson(Map<String, dynamic> json) =>
      _$EssayModelFromJson(json);

  Map<String, dynamic> toJson() => _$EssayModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        author,
        title,
        body,
        likes,
        tags,
      ];
}
