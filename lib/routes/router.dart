import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example_app/pages/home/home_page.dart';
import 'package:auto_route_example_app/pages/posts/post_page.dart';
import 'package:auto_route_example_app/pages/posts/single_post_page.dart';
import 'package:auto_route_example_app/pages/settings/settings_page.dart';
import 'package:auto_route_example_app/pages/users/user_posts_page.dart';
import 'package:auto_route_example_app/pages/users/user_profile_page.dart';
import 'package:auto_route_example_app/pages/users/users_page.dart';
import 'package:flutter/cupertino.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/', page: HomePage, children: [
      AutoRoute(
        path: 'posts',
        name: 'PostsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: PostsPage,
          ),
          AutoRoute(
            path: ':postId',
            page: SinglePostPage,
          ),
        ],
      ),
      AutoRoute(
        path: 'users',
        name: 'UsersRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: UsersPage,
          ),
          AutoRoute(
            path: ':userId',
            page: UserProfilePage,         
          ),
          AutoRoute(
            path: ':userId',
            page: UserPostsPage,
          ),
          AutoRoute(
            path: ':postId',
            page: SinglePostPage,
          ),
        ],
      ),
      AutoRoute(
        path: 'settings',
        name: 'SettingsRouter',
        page: SettingsPage,
      ),
    ]),
  ],
)
class $AppRouter {}
