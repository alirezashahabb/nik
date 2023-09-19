import 'package:nikeshop/data/datasoruce/comment_dataSoruce.dart';
import 'package:nikeshop/data/repositroy/product_repositroy.dart';
import 'package:nikeshop/model/comment.dart';

final commentRepositroy = CommentRepository(CommentRemoteDataSorce(httpClient));

abstract class ICommentRepositroy {
  Future<List<CommentEntity>> getComment(int id);
}

class CommentRepository implements ICommentRepositroy {
  final CommentRemoteDataSorce dataSorce;

  CommentRepository(this.dataSorce);
  @override
  Future<List<CommentEntity>> getComment(int id) => dataSorce.getAll(id);
}
