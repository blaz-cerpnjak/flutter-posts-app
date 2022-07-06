import 'package:auto_route_example_app/models/user/user_model.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final String title;
  final String content;
  final void Function() onTileTap;
  final User? user;

  const PostTile({
    Key? key,
    required this.title,
    required this.content,
    required this.onTileTap,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTileTap,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                '${content.substring(0, 30)}...',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '@${user?.username}',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}