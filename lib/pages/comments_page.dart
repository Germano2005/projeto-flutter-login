import 'package:flutter/material.dart';
import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/comments_repository.dart';

class CommentsPage extends StatefulWidget {
  final int postId;
  const CommentsPage({super.key, required this.postId});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  var commentsRepository = CommentsRepository();
  var comments = <CommentModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async{
    comments = await commentsRepository.getComments(widget.postId);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Comentários do Post: ${widget.postId}"),
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: ListView.builder(
              itemCount: comments.length,
                itemBuilder: (_, index){
              var comment = comments[index];
              return Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nome: ${comment.name.substring(0, 6)}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                            Text("Email: ${comment.email}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(comment.body),
                      ],
                    ),
                  ));
            }),
          ),
        )
    );
  }
}
