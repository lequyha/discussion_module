import 'package:discussion_module/src/data/repositories/remote/comment_repository.dart';
import 'package:discussion_module/src/domain/entities/comment_entity.dart';
import 'package:discussion_module/src/domain/models/comment_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'comment_event.dart';
part 'comment_state.dart';

const _commentLimit = 15;

@injectable
class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository _commentRepository;

  CommentBloc({required CommentRepository commentRepository})
      : _commentRepository = commentRepository,
        super(CommentState()) {
    on<CommentsFetched>(_onCommentsFetched);
    on<CommentCreated>(_onCommentCreated);
  }

  /// Handles fetching comments for the given object.
  Future<void> _onCommentsFetched(
    CommentsFetched event,
    Emitter<CommentState> emit,
  ) async {
    try {
      final entities = await _commentRepository.getAllComments(
        objectId: event.objectId,
        objectType: CommentType.ticket,
      );
      final comments = _mapEntitiesToComments(entities);
      emit(state.copyWith(
        status: CommentStatus.success,
        comments: comments,
      ));
    } catch (error, stackTrace) {
      _handleError(error, stackTrace, '_onCommentsFetched');
      emit(state.copyWith(status: CommentStatus.error));
    }
  }

  /// Handles creating a new comment and refreshing the list.
  Future<void> _onCommentCreated(
    CommentCreated event,
    Emitter<CommentState> emit,
  ) async {
    try {
      final entities = await _commentRepository.createNewComment(
        objId: event.objectId,
        comment: '<span>${event.comment}</span>',
        objectType: CommentType.ticket,
      );
      final comments = _mapEntitiesToComments(entities);
      emit(state.copyWith(
        status: CommentStatus.success,
        comments: comments,
      ));
    } catch (error, stackTrace) {
      _handleError(error, stackTrace, '_onCommentCreated');
      emit(state.copyWith(status: CommentStatus.error));
    }
  }

  /// Maps a list of [CommentEntity] to a list of [CommentModel].
  List<CommentModel> _mapEntitiesToComments(List<CommentEntity> entities) {
    return entities
        .map((entity) => CommentModel.fromEntity(entity: entity))
        .toList();
  }

  /// Logs and handles errors in the bloc.
  void _handleError(Object error, StackTrace stackTrace, String methodName) {
    onError(error, stackTrace);
  }
}
