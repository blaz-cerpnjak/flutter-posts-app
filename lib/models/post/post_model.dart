import 'dart:convert';
import 'package:auto_route_example_app/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

@JsonSerializable(createToJson: false)
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  User? user;

  Post({
      required this.userId,
      required this.id,
      required this.title,
      required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
  );

  Map<String, dynamic> toJson() => {
      "userId": userId,
      "id": id,
      "title": title,
      "body": body,
  };
}