import 'package:cherryinstangramuiclone/models/post_model.dart';
import 'package:flutter/material.dart';

class PhotoGridSection extends StatelessWidget {
  const PhotoGridSection({@required this.posts}) : assert(posts != null);
  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    if (posts.length > 0) {
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        delegate: SliverChildListDelegate(
          List.generate(
            posts.length,
            (index) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(posts[index].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Text(
          "Profilo Privato",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
