import 'package:flutter/material.dart';
import 'package:popcorntv/Screens/Fscreen.dart';
import 'package:popcorntv/Screens/grid.dart';
import 'package:popcorntv/utilites/torrent.dart';
import 'package:popcorntv/widgets/sidemenu.dart';

class Homepage extends StatefulWidget {
  final String title;
  Homepage({this.title});
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
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
    Tab(text: "GENRES"),
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
              Fscreen(
                sortvalue: 'updated',
              ),
              Fscreen(sortvalue: 'trending'),
              Fscreen(sortvalue: ''),
              Fscreen(sortvalue: 'rating'),
              Fscreen(sortvalue: 'released'),
              Fscreen(sortvalue: 'year'),
              Fscreen(sortvalue: 'name'),

              //          MyApp(),
            ],
          ),
        ),
      ),
    );
  }
}
