part of 'comment_bloc.dart';

enum CommentStatus { initial, success, error }

class CommentState extends Equatable {
  final CommentStatus status;
  final List<CommentModel> comments;

  // Constructor with a default value for `comments`
  CommentState({
    this.status = CommentStatus.initial,
    List<CommentModel>? comments,
  }) : comments = comments ??
            List.generate(
              _commentLimit,
              (_) => CommentModel.skeletonizer,
            );

  /// Creates a new state by copying the existing one with optional updates.
  CommentState copyWith({
    CommentStatus? status,
    List<CommentModel>? comments,
  }) {
    return CommentState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
    );
  }

  // Utility getters for state checks
  bool get isInitial => status == CommentStatus.initial;
  bool get isSuccess => status == CommentStatus.success;
  bool get isError => status == CommentStatus.error;

  @override
  List<Object> get props => [status, comments];
}
