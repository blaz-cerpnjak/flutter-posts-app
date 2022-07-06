import 'package:auto_route_example_app/models/post/post_model.dart';
import 'package:flutter/material.dart';

class PostInfoPage extends StatelessWidget {
  final Post? post;

  const PostInfoPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post != null ? post!.title : 'Unknown',
             style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          Text(
            post != null && post!.user != null ? 'Author: ${post!.user!.name}' : 'Author: unknown',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 5),
          const Divider(color: Colors.grey, height: 2),
          const SizedBox(height: 20),
          Text(
            post != null ? post!.body : 'Empty',
            textAlign: TextAlign.start,
             style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}