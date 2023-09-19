part of 'comment_bloc.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentLoadingState extends CommentState {}

class CommentSuccsessState extends CommentState {
  final List<CommentEntity> comments;

  const CommentSuccsessState(this.comments);

  @override
  List<Object> get props => [comments];
}

class CommentErrorState extends CommentState {
  final AppExption exption;

  const CommentErrorState(this.exption);

  @override
  // TODO: implement props
  List<Object> get props => [exption];
}
