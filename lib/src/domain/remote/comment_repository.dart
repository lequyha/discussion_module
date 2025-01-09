import 'package:discussion_module/src/domain/models/comment_model.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> getAllComments({
    required int objectId,
    required CommentType objectType,
  });
}
