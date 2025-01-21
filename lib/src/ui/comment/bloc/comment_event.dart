part of 'comment_bloc.dart';

sealed class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

final class CommentsFetched extends CommentEvent {
  final int objectId;

  const CommentsFetched({required this.objectId});

  @override
  List<Object> get props => [objectId];
}

final class CommentCreated extends CommentEvent {
  final int objectId;
  final String comment;

  const CommentCreated({
    required this.objectId,
    required this.comment,
  });

  @override
  List<Object> get props => [objectId, comment];
}
