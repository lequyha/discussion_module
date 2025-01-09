import 'package:discussion_module/src/domain/models/comment_model.dart';
import 'package:discussion_module/src/domain/remote/comment_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'comment_event.dart';
part 'comment_state.dart';

const _commentLimit = 15;

@injectable
class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository _commentRepository;

  CommentBloc({
    required CommentRepository commentRepository,
  })  : _commentRepository = commentRepository,
        super(CommentState()) {
    on<CommentsFetched>(_onCommentsFetched);
  }

  Future<void> _onCommentsFetched(
    CommentsFetched event,
    Emitter<CommentState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      final comments = await _commentRepository.getAllComments(
        objectId: event.objectId,
        objectType: CommentType.ticket,
      );
      emit(
        state.copyWith(
          status: CommentStatus.success,
          comments: comments,
        ),
      );
    } catch (error, stackTrace) {
      onError(error, stackTrace);
      emit(state.copyWith(status: CommentStatus.error));
    }
  }
}
