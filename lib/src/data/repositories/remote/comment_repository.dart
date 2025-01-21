import 'package:core_module/core_module.dart';
import 'package:discussion_module/src/domain/entities/comment_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CommentRepository extends BaseApiRepository {
  final CommentService _commentService;

  CommentRepository({required CommentService commentService})
      : _commentService = commentService;

  Future<List<CommentEntity>> getAllComments({
    required int objectId,
    required CommentType objectType,
  }) async {
    final dataState = await getStateOf<BaseResponseModel<CommentDto>>(
      request: () => _commentService.getAllComments(
        objectId: objectId,
        objectType: objectType.name,
      ),
    );
    if (dataState is DataSuccess) {
      final comments = (dataState.data?.dataList ?? [])
          .map((dto) => CommentEntity.fromDto(dto: dto))
          .toList();
      return comments;
    } else {
      throw dataState.errorMessage;
    }
  }

  Future<List<CommentEntity>> createNewComment({
    required int objId,
    required String comment,
    required CommentType objectType,
  }) async {
    final dataState = await getStateOf<BaseResponseModel<CommentDto>>(
      request: () => _commentService.createNewComment(
        objId: objId,
        comment: comment,
        objectType: objectType.name,
      ),
    );
    if (dataState is DataSuccess) {
      final comments = (dataState.data?.dataList ?? [])
          .map((dto) => CommentEntity.fromDto(dto: dto))
          .toList();
      return comments;
    } else {
      throw dataState.errorMessage;
    }
  }
}
