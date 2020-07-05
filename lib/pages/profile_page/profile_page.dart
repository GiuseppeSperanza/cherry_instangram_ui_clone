import 'package:cherryinstangramuiclone/models/post_model.dart';
import 'package:cherryinstangramuiclone/models/profile_model.dart';
import 'package:cherryinstangramuiclone/models/user_model.dart';
import 'package:cherryinstangramuiclone/pages/profile_page/sub_sections/photo_grid_section.dart';
import 'package:cherryinstangramuiclone/pages/profile_page/sub_sections/profile_header_section.dart';
import 'package:cherryinstangramuiclone/provider/user_profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProfileModel>(
      future: downloadUserProfile(),
      builder: (BuildContext context, AsyncSnapshot<ProfileModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CustomScrollView(
            slivers: <Widget>[
              ProfileHeaderSection(user: snapshot.data.user),
              PhotoGridSection(posts: snapshot.data.posts),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
