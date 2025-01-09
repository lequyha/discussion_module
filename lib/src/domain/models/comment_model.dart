import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';

part 'comment_model.g.dart';

enum CommentType {
  @JsonValue('Ticket')
  ticket,
}

@freezed
class CommentModel with _$CommentModel {
  const CommentModel._();

  const factory CommentModel({
    @Default(-1) final int id,
    @Default(-1) final int objectId,
    @Default('') final String creatorKey,
    final String? created,
    final String? creatorEmail,
    final bool? isPrivate,
    final String? body,
    @JsonKey(name: 'Avatar') final String? avatar,
    @JsonKey(name: 'TotalReply') final int? totalReply,
    final CommentType? objectType,
    final String? creatorFullName,
    final String? updated,
    final String? updaterKey,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  static const fakeData = CommentModel(
    id: -1,
    objectId: -1,
    body: 'Comment body',
  );
}
