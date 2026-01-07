import 'package:flutter/material.dart';
import 'package:trilhaapp/model/post_model.dart';
import 'package:trilhaapp/repositories/posts_repository.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  var postsRepository = PostsRepository();
  var posts = <PostModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async{
    var lista =  await postsRepository.getPosts();
    setState(() {
      posts = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
          body: ListView.builder(
            itemCount: posts.length,
              itemBuilder: (_, index){
              var post = posts[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(post.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                          SizedBox(
                            height: 10,
                          ),
                          Text(post.body, style: TextStyle(fontSize: 14),),
                        ],
                      )),
                ),
              );
              }),
    ));
  }
}
