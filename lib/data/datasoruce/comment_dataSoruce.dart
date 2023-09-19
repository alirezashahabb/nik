import 'package:dio/dio.dart';
import 'package:nikeshop/model/comment.dart';
import 'package:nikeshop/utils/responce_validator.dart';

abstract class IcommentDataSorce {
  Future<List<CommentEntity>> getAll(int id);
}

class CommentRemoteDataSorce
    with HttpResponceValidator
    implements IcommentDataSorce {
  final Dio httpClient;

  CommentRemoteDataSorce(this.httpClient);
  @override
  Future<List<CommentEntity>> getAll(int id) async {
    Response response = await httpClient.get('comment/list?product_id=$id');
    valiadateResponce(response);

    /// convertTo list
    final List<CommentEntity> comments = [];
    for (var element in (response.data as List)) {
      comments.add(CommentEntity.fromJson(element));
    }

    return comments;
  }
}
