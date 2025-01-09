import 'package:core_module/core_module.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:discussion_module/src/domain/models/comment_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_service.g.dart';

@lazySingleton
@RestApi()
abstract class CommentService {
  @factoryMethod
  factory CommentService(Dio dio, {String baseUrl}) = _CommentService;

  @factoryMethod
  static CommentService create(Dio dio) {
    return CommentService(dio, baseUrl: '/rest/sms/latest/integration-comment');
  }

  @GET('/load?objectId={objectId}&objectType={objectType}')
  Future<HttpResponse<BaseResponseModel<CommentModel>>> getAllNotifications({
    @Path('objectId') required int objectId,
    @Path('objectType') required CommentType objectType,
  });
}
