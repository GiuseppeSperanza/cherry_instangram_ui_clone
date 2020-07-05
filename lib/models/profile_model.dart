import 'package:cherryinstangramuiclone/models/post_model.dart';
import 'package:cherryinstangramuiclone/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class ProfileModel {
  final UserModel user;
  final List<PostModel> posts;

  const ProfileModel({
    @required this.user,
    @required this.posts,
  });

  factory ProfileModel.fromData(dynamic data) {
    final UserModel user = UserModel.fromData(data["graphql"]["user"]);

    final List<dynamic> postsDynamic =
        data["graphql"]["user"]["edge_owner_to_timeline_media"]["edges"];

    List<PostModel> posts = postsDynamic
        .map((postData) => PostModel.fromData(postData["node"]))
        .toList(); //map restituisce un'iterable per usare filtri

    return ProfileModel(
      user: user,
      posts: posts,
    );
  }
}
