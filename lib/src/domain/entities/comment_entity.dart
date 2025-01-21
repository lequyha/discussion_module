import 'package:core_module/core_module.dart';

enum CommentType { ticket, comment, unknown }

class CommentEntity {
  final int id;
  final int objectId;
  final String createdUsername;
  final DateTime? createdDateTime;
  final String body;
  final String userAvatar;
  final CommentType type;
  final bool isPrivate;
  final int replyTotal;
  final List<CommentEntity> replyComments;

  CommentEntity({
    required this.id,
    required this.objectId,
    required this.createdUsername,
    this.createdDateTime,
    required this.body,
    required this.userAvatar,
    required this.type,
    required this.isPrivate,
    required this.replyTotal,
    required this.replyComments,
  });

  factory CommentEntity.fromDto({required CommentDto dto}) {
    final replyComments = (dto.replies ?? [])
        .map((dto) => CommentEntity.fromDto(dto: dto))
        .toList();
    return CommentEntity(
      id: dto.id ?? -1,
      objectId: dto.objectId ?? -1,
      createdUsername: dto.creatorKey ?? '',
      createdDateTime:
          dto.created?.toDateTime(inputFormat: DateFormats.ddMmmyyhhmma),
      body: dto.body ?? '',
      userAvatar: dto.avatar ?? '',
      type: dto.objectType != null
          ? CommentType.values.byName(dto.objectType?.toLowerCase() ?? '')
          : CommentType.unknown,
      isPrivate: dto.isPrivate ?? false,
      replyTotal: dto.totalReply ?? 0,
      replyComments: replyComments,
    );
  }
}
