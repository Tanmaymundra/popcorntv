import 'package:flutter/material.dart';
import 'package:popcorntv/Screens/movietab.dart';
import 'package:popcorntv/Screens/genres.dart';
import 'package:popcorntv/Screens/seriestab.dart';
import 'package:popcorntv/widgets/sidemenu.dart';

class seriesHomepage extends StatefulWidget {
  final String title;
  seriesHomepage({this.title});
  @override
  _seriesHomepageState createState() => _seriesHomepageState();
}

class _seriesHomepageState extends State<seriesHomepage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: tablist.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  List<Tab> tablist = [
    //Tab(text: "GENRES"),
    Tab(text: "TRENDING"),
    Tab(text: "POPULAR"),
    Tab(text: "TOP RATED"),
    Tab(text: "RELEASE DATE"),
    Tab(text: "YEAR"),
    Tab(text: "A-Z")
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tablist.length,
      child: Scaffold(
        backgroundColor: Color(0x3F51B5ff),
        drawer: Sidemenu(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text(widget.title),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  isScrollable: true,
                  tabs: tablist,
                  controller: _tabController,
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              //genrelist(),
              seriestab(sortvalue: 'trending'),
              seriestab(sortvalue: ''),
              seriestab(sortvalue: 'rating'),
              seriestab(sortvalue: 'released'),
              seriestab(sortvalue: 'year'),
              seriestab(sortvalue: 'name'),

              //          MyApp(),
            ],
          ),
        ),
      ),
    );
  }
}
