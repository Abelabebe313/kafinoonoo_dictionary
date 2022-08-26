import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project01/screens/aboutUs.dart';
import 'package:project01/screens/favoritePage.dart';
import 'package:project01/screens/home.dart';

import 'bottom_navigation.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.brown.shade900,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: <Widget>[
            SizedBox(height: 50.0),
            buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            SizedBox(height: 10.0),
            buildMenuItem(
              text: 'Favorite',
              icon: Icons.favorite,
              onClicked: () => selectedItem(context, 1),
            ),
            SizedBox(height: 10.0),
            buildMenuItem(
              text: 'Share',
              icon: Icons.share,
              onClicked: () => selectedItem(context, 2),
            ),
            Divider(color: Colors.white),
            SizedBox(height: 10.0),
            buildMenuItem(
              text: 'About Us',
              icon: Icons.info,
              onClicked: () => selectedItem(context, 3),
            ),
            SizedBox(height: 10.0),
            buildMenuItem(
              text: 'Rate',
              icon: Icons.star,
              onClicked: () => selectedItem(context, 4),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem(
    {required String text, required IconData icon, VoidCallback? onClicked}) {
  final Color = Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(icon, color: Color),
    title: Text(text, style: TextStyle(color: Color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomBar()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FavoritePage()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => aboutPage()),
      );
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => aboutPage()),
      );
      break;
    case 4:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => aboutPage()),
      );
      break;
  }
}
