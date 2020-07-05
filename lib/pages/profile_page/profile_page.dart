import 'package:cherryinstangramuiclone/models/profile_model.dart';
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
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: <Widget>[
                ProfileHeaderSection(user: snapshot.data.user),
                PhotoGridSection(posts: snapshot.data.posts),
              ],
            );
          } else {
            return Center(
              child: Text(
                "Utente Non Esistente",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
