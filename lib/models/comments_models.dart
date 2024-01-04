import 'package:json_annotation/json_annotation.dart';

part 'comments_models.g.dart';

@JsonSerializable()
class Comment {
  final String id;
  final String description;

  @JsonKey(name: 'updated_at')
  final String updateDate;

  @JsonKey(name: 'task_id')
  final String? taskId;

  @JsonKey(name: 'creator_avatar')
  final String? avatar;

  final List<Comment>? replies;

  Comment(
      this.replies,
      this.taskId,
      this.avatar,
      {
    required this.id,
    required this.description,
    required this.updateDate,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
