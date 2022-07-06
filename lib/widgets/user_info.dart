import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example_app/models/user/user_model.dart';
import 'package:auto_route_example_app/routes/router.gr.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  final User? user;

  const UserInfoPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = user != null ? user!.name : 'Unknown';
    final username = user != null ? user!.username : 'Unknown';
    final email = user != null ? user!.email : 'Unknown';
    final phone = user != null ? user!.phone : 'Unknown';
    final website = user != null ? user!.website : 'Unknown';
    final company = user != null ? user!.company.name : 'Unknown';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'lib/assets/user_image.png',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                name,
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: 5),
              Text(
                '@$username',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.grey, thickness: 1.5),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoRow(title: 'Email', content: email),
                const SizedBox(height: 10),
                UserInfoRow(title: 'Phone', content: phone),
                const SizedBox(height: 10),
                UserInfoRow(title: 'Website', content: website),
                const SizedBox(height: 10),
                UserInfoRow(title: 'Company', content: company),
              ]
            ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.grey, thickness: 1.5),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.router.push(
                  UserPostsRoute(userId: user!.id),
                );
              }, 
              child: const Text('Show all posts'),
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfoRow extends StatelessWidget {
  final String title;
  final String content;

  const UserInfoRow({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          content,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}