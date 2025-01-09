import 'package:core_module/core_module.dart';
import 'package:discussion_module/src/data/service/comment_service.dart';
import 'package:discussion_module/src/domain/models/comment_model.dart';
import 'package:discussion_module/src/domain/remote/comment_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CommentRepository)
class CommentRepositoryImpl extends BaseApiRepository
    implements CommentRepository {
  final CommentService _commentService;

  CommentRepositoryImpl({required CommentService commentService})
      : _commentService = commentService;

  @override
  Future<List<CommentModel>> getAllComments({
    required int objectId,
    required CommentType objectType,
  }) async {
    final dataState = await getStateOf<BaseResponseModel<CommentModel>>(
      request: () => _commentService.getAllNotifications(
        objectId: objectId,
        objectType: objectType,
      ),
    );
    if (dataState is DataSuccess) {
      return dataState.data?.dataList ?? [];
    } else {
      throw dataState.errorMessage;
    }
  }
}
