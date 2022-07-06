import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example_app/models/post/post_model.dart';
import 'package:auto_route_example_app/services/remote_service.dart';
import 'package:auto_route_example_app/widgets/post_info.dart';
import 'package:flutter/material.dart';

class SinglePostPage extends StatelessWidget {
  final int postId;

  const SinglePostPage({
    Key? key,
    @PathParam() required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getPost(postId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              final post = snapshot.data as Post;
              return PostInfoPage(post: post);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        ),
      )
    );
  }

  Future<Post?> getPost(int id) async {
    Post? post = await RemoteService().getPost(id);
    post?.user = await RemoteService().getUser(post.userId);
    return post;
  } 
}