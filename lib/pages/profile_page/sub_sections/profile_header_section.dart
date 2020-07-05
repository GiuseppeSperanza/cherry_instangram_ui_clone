import 'package:cherryinstangramuiclone/models/user_model.dart';
import 'package:cherryinstangramuiclone/widgets/dialog.dart';
import 'package:cherryinstangramuiclone/widgets/user_statistics.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({@required this.user}) : assert(user != null);
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    final List<String> labels = ["posts", "followes", "following"];
    final List<int> values = [
      user.numPosts,
      user.numFollowers,
      user.numFollowing
    ];

    _launchURL(String link) async {
      if (await canLaunch(link)) {
        await launch(link);
      } else {
        //TODO gestire eccezione
        throw 'Errore durante apertura link $link';
      }
    }

    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(user.imageUrl),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            user.username,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          MaterialButton(
                            onPressed: () => showDialogPopup(context, "Segui"),
                            minWidth:
                                double.infinity, //prende tutta la larghezza
                            height: 30,
                            color: Colors.blue.shade600,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "Segui",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  user.fullname,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(user.bio),
                user.link != null
                    ? FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () => _launchURL(user.link),
                        child: Text(
                          user.link,
                          style: TextStyle(
                            color: Colors.indigo.shade800,
                          ),
                        ),
                      )
                    : Text(""),
              ],
            ),
          ),
          UserStatistics(
            labels: labels,
            values: values,
          ),
        ],
      ),
    );
  }
}
