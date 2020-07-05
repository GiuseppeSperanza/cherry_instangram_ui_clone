import 'package:cherryinstangramuiclone/pages/profile_page/profile_page.dart';
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
        selectedIconTheme: IconThemeData(color: Colors.indigo),
        unselectedIconTheme: IconThemeData(color: Colors.black),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(SimpleLineIcons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.search),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(SimpleLineIcons.plus),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(SimpleLineIcons.heart),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(SimpleLineIcons.user),
            title: Text("Home"),
          ),
        ],
      ),
    );
  }
}
