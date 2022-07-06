import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example_app/models/user/user_model.dart';
import 'package:auto_route_example_app/routes/router.gr.dart';
import 'package:auto_route_example_app/services/remote_service.dart';
import 'package:auto_route_example_app/widgets/refresh_widget.dart';
import 'package:auto_route_example_app/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              final List<User> users = snapshot.data as List<User>;
    
              return RefreshWidget(
                onRefresh: getUsers,
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return UserTile(
                      name: users[index].name, 
                      username: users[index].username,
                      onTap: () {
                        context.router.push(
                          UserProfileRoute(userId: users[index].id),
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

  Future<List?> getUsers() async {
    return await RemoteService().getUsers();
  }
}
