import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popcorntv/Screens/moviehompage.dart';
import 'package:popcorntv/Screens/serieshomepage.dart';

class Sidemenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.grey[900],
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
        primaryColor: Color(0x303f9fff),
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0x303f9fff),
              ),
              child: UserAccountsDrawerHeader(
                currentAccountPicture: FlutterLogo(
                  size: 42,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.local_movies,
                color: Colors.white,
              ),
              title: Text('Movies'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => movieHomepage(
                      title: 'Movies',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.laptop, color: Colors.white),
              title: Text('Series'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        seriesHomepage(title: 'Series'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.border_all, color: Colors.white),
              title: Text('Anime'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Preferences'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
