import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example_app/models/post/post_model.dart';
import 'package:auto_route_example_app/routes/router.gr.dart';
import 'package:auto_route_example_app/services/remote_service.dart';
import 'package:auto_route_example_app/widgets/post_tile.dart';
import 'package:auto_route_example_app/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';

class UserPostsPage extends StatefulWidget {
  final int userId;

  const UserPostsPage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<UserPostsPage> createState() => _UserPostsPageState();
}

class _UserPostsPageState extends State<UserPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: getPosts(widget.userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              final List<Post> posts = snapshot.data as List<Post>;
    
              return RefreshWidget(
                onRefresh: () => getPosts(widget.userId),
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return PostTile(
                        title: posts[index].title,
                        content: posts[index].body,
                        user: posts[index].user,
                        onTileTap: () {
                          context.router.navigate(
                            SinglePostRoute(postId: posts[index].id)
                          );
                        },
                    );
                  },
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future<List?> getPosts(int userId) async {
    List<Post>? posts = await RemoteService().getPostsByUser(userId);

    posts?.forEach((post) async {
      post.user = await RemoteService().getUser(post.userId);
    });

    return posts;
  }
}