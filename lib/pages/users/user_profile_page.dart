import 'package:auto_route/annotations.dart';
import 'package:auto_route_example_app/models/user/user_model.dart';
import 'package:auto_route_example_app/services/remote_service.dart';
import 'package:auto_route_example_app/widgets/user_info.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final int userId;

  const UserProfilePage({
    Key? key,
    @PathParam() required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getUser(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              final user = snapshot.data as User;
              return UserInfoPage(user: user);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        ),
      ),
    );
  }

  Future<User?> getUser(int id) async {
    User? user = await RemoteService().getUser(id);
    return user;
  } 
}