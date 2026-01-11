
import 'package:trilhaapp/model/post_model.dart';
import 'package:trilhaapp/repositories/jsonplaceholder_custon_dio.dart';
import 'package:trilhaapp/repositories/posts_repository.dart';

class PostsDioRepository implements PostsRepository{
  @override
  Future<List<PostModel>> getPosts() async {

    var json = JsonplaceholderCustonDio();
    
    var response = await json.dio.get("/posts");

    if(response.statusCode == 200){
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    }

    return [];
  }

}