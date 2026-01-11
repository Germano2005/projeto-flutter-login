import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/comments_repository.dart';
import 'package:trilhaapp/repositories/jsonplaceholder_custon_dio.dart';

class CommentsDioRepository implements CommentsRepository{
  @override
  Future<List<CommentModel>> getComments(int postId) async{

    var json = JsonplaceholderCustonDio();

    var response = await json.dio.get("/posts/$postId/comments");

    if(response.statusCode == 200){
      return (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
    }

    return [];
  }

}