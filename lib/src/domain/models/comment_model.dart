import 'package:core_module/core_module.dart';
import 'package:discussion_module/src/domain/entities/comment_entity.dart';

class CommentModel {
  final int id;
  final int? ticketId;
  final int? commentId;
  final String createdUsername;
  final String createdTimeAgo;
  final String body;
  final String userAvatar;
  final CommentType type;
  final bool status;
  final bool isPrivate;
  final int replyTotal;
  final List<CommentModel> replyComments;

  CommentModel({
    required this.id,
    this.ticketId,
    this.commentId,
    this.createdUsername = '',
    this.createdTimeAgo = '',
    this.body = '',
    this.userAvatar = '',
    this.type = CommentType.unknown,
    this.status = true,
    this.isPrivate = false,
    this.replyTotal = 0,
    this.replyComments = const <CommentModel>[],
  });

  factory CommentModel.fromEntity({required CommentEntity entity}) {
    final replyComments = entity.replyComments
        .map((dto) => CommentModel.fromEntity(entity: dto))
        .toList();
    return CommentModel(
      id: entity.id,
      ticketId: entity.type == CommentType.ticket ? entity.objectId : null,
      commentId: entity.type == CommentType.comment ? entity.objectId : null,
      createdUsername: entity.createdUsername,
      createdTimeAgo: entity.createdDateTime != null
          ? formatTimeAgo(entity.createdDateTime!)
          : '',
      body: entity.body,
      userAvatar: entity.userAvatar,
      type: entity.type,
      isPrivate: entity.isPrivate,
      replyTotal: entity.replyTotal,
      replyComments: replyComments,
    );
  }

  static final skeletonizer = CommentModel(
    id: -1,
    body: 'Comment body',
    createdUsername: 'Comment created username',
    createdTimeAgo: 'Comment created time ago',
    userAvatar: 'comment user avatar',
  );
}
