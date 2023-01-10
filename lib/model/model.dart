// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.createdAt,
    required this.authorId,
    required this.authorName,
    required this.description,
    required this.media,
    required this.likeCount,
    required this.disLikeCount,
    required this.authorProfileImage,
    required this.id,
    required this.comments,
    required this.postId,
  });

  DateTime createdAt;
  String authorId;
  String authorName;
  String description;
  String? media;
  int likeCount;
  int disLikeCount;
  String authorProfileImage;
  String id;
  List<Post>? comments;
  String? postId;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    createdAt: DateTime.parse(json["createdAt"]),
    authorId: json["authorId"],
    authorName: json["authorName"],
    description: json["description"],
    media: json["media"],
    likeCount: json["likeCount"],
    disLikeCount: json["disLikeCount"],
    authorProfileImage: json["authorProfileImage"],
    id: json["id"],
    comments: json["comments"] == null ? null : List<Post>.from(json["comments"].map((x) => Post.fromJson(x))),
    postId: json["postId"] == null ? null : json["postId"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "authorId": authorId,
    "authorName": authorName,
    "description": description,
    "media": media == null ? null : media,
    "likeCount": likeCount,
    "disLikeCount": disLikeCount,
    "authorProfileImage": authorProfileImage,
    "id": id,
    "comments": comments == null ? null : List<dynamic>.from(comments!.map((x) => x.toJson())),
    "postId": postId == null ? null : postId,
  };
}
