import 'package:cherryinstangramuiclone/pages/profile_page/profile_page.dart';
import 'package:cherryinstangramuiclone/shared/constants/general.dart';
import 'package:cherryinstangramuiclone/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cherry Ui Mokup'),
        centerTitle: true,
      ),
      body: ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) =>
            showDialogPopup(context, BOTTOM_TAB_NAVIGATION[index]),
        selectedIconTheme: IconThemeData(color: Colors.indigo),
        unselectedIconTheme: IconThemeData(color: Colors.black),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(SimpleLineIcons.home),
            title: Text(BOTTOM_TAB_NAVIGATION[0]),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.search),
            title: Text(BOTTOM_TAB_NAVIGATION[1]),
          ),
          BottomNavigationBarItem(
            icon: Icon(SimpleLineIcons.plus),
            title: Text(BOTTOM_TAB_NAVIGATION[2]),
          ),
          BottomNavigationBarItem(
            icon: Icon(SimpleLineIcons.heart),
            title: Text(BOTTOM_TAB_NAVIGATION[3]),
          ),
          BottomNavigationBarItem(
            icon: Icon(SimpleLineIcons.user),
            title: Text(BOTTOM_TAB_NAVIGATION[4]),
          ),
        ],
      ),
    );
  }
}
