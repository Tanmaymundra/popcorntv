import 'package:flutter/material.dart';
import 'package:flutter_torrent_streamer/flutter_torrent_streamer.dart';
import 'package:popcorntv/Screens/moviehompage.dart';

import 'package:popcorntv/widgets/sidemenu.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await TorrentStreamer.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: Colors.white,
              bodyColor: Colors.white,
            ),
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: movieHomepage(
        title: 'Movies',
      ),
    );
  }
}
