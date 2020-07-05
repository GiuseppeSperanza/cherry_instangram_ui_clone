import 'package:flutter/cupertino.dart';

class UserModel {
  final String fullname;
  final String username; //id account
  final String imageUrl;
  final String bio;
  final String link;
  final int numPosts;
  final int numFollowers;
  final int numFollowing;

  const UserModel({
    @required this.fullname,
    @required this.username,
    @required this.imageUrl,
    @required this.bio,
    @required this.link,
    @required this.numPosts,
    @required this.numFollowers,
    @required this.numFollowing,
  });

  factory UserModel.fromData(dynamic data) {
    final String fullname = data["full_name"];
    final String username = data["username"];
    final String imageUrl = data["profile_pic_url"];
    final String bio = data["biography"];
    final String link = data["external_url"];
    final int numPosts = data["edge_owner_to_timeline_media"]["count"];
    final int numFollowers = data["edge_followed_by"]["count"];
    final int numFollowing = data["edge_follow"]["count"];

    return UserModel(
      fullname: fullname,
      username: username,
      imageUrl: imageUrl,
      bio: bio,
      link: link,
      numPosts: numPosts,
      numFollowers: numFollowers,
      numFollowing: numFollowing,
    );
  }
}
