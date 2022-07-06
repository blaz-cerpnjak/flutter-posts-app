import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example_app/models/post/post_model.dart';
import 'package:auto_route_example_app/routes/router.gr.dart';
import 'package:auto_route_example_app/services/remote_service.dart';
import 'package:auto_route_example_app/widgets/post_tile.dart';
import 'package:auto_route_example_app/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: getPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              final List<Post> posts = snapshot.data as List<Post>;
    
              return RefreshWidget(
                onRefresh: getPosts,
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return PostTile(
                        title: posts[index].title,
                        content: posts[index].body,
                        user: posts[index].user,
                        onTileTap: () {
                          context.router.push(
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

  Future<List?> getPosts() async {
    List<Post>? posts = await RemoteService().getPosts();
    
    posts?.forEach((post) async {
      post.user = await RemoteService().getUser(post.userId);
    });

    return posts;
  }
}
