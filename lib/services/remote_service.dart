import 'dart:convert';
import 'package:auto_route_example_app/models/post/post_model.dart';
import 'package:auto_route_example_app/models/user/user_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {

  Future<List<User>?> getUsers() async {
    try {
      var client = http.Client();

      var uri = Uri.parse("https://jsonplaceholder.typicode.com/users/");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        return List<User>.from(jsonDecode(json).map((x) => User.fromJson(x)));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<User?> getUser(int id) async {
    try {
      var client = http.Client();

      var uri = Uri.parse("https://jsonplaceholder.typicode.com/users/$id");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        return User.fromJson(jsonDecode(json));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Post>?>? getPosts() async {
    try {
      var client = http.Client();

      var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        return List<Post>.from(jsonDecode(json).map((x) => Post.fromJson(x)));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Post>?>? getPostsByUser(int userId) async {
    try {
      var client = http.Client();

      var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts?userId=$userId");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        return List<Post>.from(jsonDecode(json).map((x) => Post.fromJson(x)));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<Post?> getPost(int id) async {
    try {
      var client = http.Client();

      var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        return Post.fromJson(jsonDecode(json));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}