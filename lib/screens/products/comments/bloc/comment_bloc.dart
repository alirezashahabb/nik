import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nikeshop/data/repositroy/comemnt_repositroy.dart';
import 'package:nikeshop/model/comment.dart';
import 'package:nikeshop/utils/exaption.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final ICommentRepositroy repositroy;
  final int id;

  CommentBloc(this.repositroy, this.id) : super(CommentLoadingState()) {
    on<CommentEvent>((event, emit) async {
      if (event is CommentInitEvent) {
        emit(CommentLoadingState());

        try {
          final comment = await repositroy.getComment(id);
          emit(CommentSuccsessState(comment));
        } catch (e) {
          emit(
            CommentErrorState(
              AppExption(),
            ),
          );
        }
      }
    });
  }
}
