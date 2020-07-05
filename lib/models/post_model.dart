import 'package:flutter/cupertino.dart';

class PostModel {
  final String imageUrl;

  const PostModel({
    @required this.imageUrl,
  });

  factory PostModel.fromData(dynamic data) {
    final String imageUrl = data["display_url"];
    return PostModel(imageUrl: imageUrl);
  }
}
