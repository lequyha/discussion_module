part of 'comment_bloc.dart';

enum CommentStatus { initial, success, error }

class CommentState extends Equatable {
  final CommentStatus status;
  final List<CommentModel> comments;
  final bool hasReachedMax;

  CommentState({
    this.status = CommentStatus.initial,
    List<CommentModel>? comments,
    this.hasReachedMax = false,
  }) : comments = comments ??
            List.filled(
              _commentLimit,
              CommentModel.fakeData,
            );

  CommentState copyWith({
    CommentStatus? status,
    List<CommentModel>? comments,
    bool? hasReachedMax,
  }) {
    return CommentState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, comments, hasReachedMax];

  bool get isInitial => status == CommentStatus.initial;

  bool get isError => status == CommentStatus.error;
}
