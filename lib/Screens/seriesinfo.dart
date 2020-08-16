import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:popcorntv/Models/tvshowinfo.dart';
import 'package:popcorntv/utilites/urlconstants.dart';
import 'package:popcorntv/utilites/webservice.dart';
import 'package:popcorntv/widgets/seasonlist.dart';
import 'package:popcorntv/widgets/seriesabout.dart';

class seriesinfo extends StatefulWidget {
  final String imdbid;
  seriesinfo({this.imdbid});
  @override
  _seriesinfoState createState() => _seriesinfoState();
}

class _seriesinfoState extends State<seriesinfo>
    with SingleTickerProviderStateMixin {
  var response;
  bool _spinner = true;
  String genreText;
  String imdburl;
  double rating;
  Color btncolor;
  Color btnicon;
  Tvshowinfo tvinfo;
  List<Tab> tablist = [Tab(text: 'About')];
  TabController controller;
  List<Widget> tabviewlist = [seriesabout()];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getdata();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void getTablist() async {
    for (var i = 0; i < tvinfo.numSeasons.toInt(); i++) {
      int num = i + 1;
      //print('Season $num');
      tablist.add(Tab(
        text: 'Season $num',
      ));
    }
  }

  void getTabviewlist() {
    for (var i = 1; i < tablist.length; i++) {
      tabviewlist.add(Seasonlist(
        tvinfo: tvinfo,
        season: i,
      ));
    }
    print('Tabviewlist done');
    print(tabviewlist);
    print(tabviewlist.length);
  }

  Future<void> getdata() async {
    String url = imdbtv + widget.imdbid;
    imdburl = imdbsearchurl + widget.imdbid;
    NetworkHelper networkHelper = NetworkHelper(url);
    response = await networkHelper.getData();
    print(response);

    //final movieinfo = movieinfoFromJson(response);
    tvinfo = Tvshowinfo.fromJson(response);
//    print('hekk');
    rating = double.parse(tvinfo.rating.percentage.toString()) / 20.0;
    //  print(rating);
    genreText = tvinfo.genres.join(',');
    getTablist();
    getTabviewlist();
    controller = TabController(length: tablist.length, vsync: this);
    setState(() {
      if (response != null) {
        setState(() {
          _spinner = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_spinner) {
      return Scaffold(
        backgroundColor: Color(0xff1F2224),
        body: Container(
          color: Colors.white10,
          child: ModalProgressHUD(
            inAsyncCall: _spinner,
            opacity: 0,
            child: Container(),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Color(0xff1F2224),
      body: Theme(
          data: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                ),
            iconTheme:
                Theme.of(context).iconTheme.copyWith(color: Colors.white),
          ),
          child: DefaultTabController(
            length: tablist.length,
            child: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                title: Text(tvinfo.title),
                expandedHeight: 500,
                floating: false,
                pinned: true,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeInImage.assetNetwork(
                    placeholder: 'assets/popcorn2.jpeg',
                    image: tvinfo.images.poster,
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  controller: controller,
                  //labelColor: Colors.blueAccent,
                  //unselectedLabelColor: Colors.indigo,
                  tabs: tablist,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: true,
                child: TabBarView(
                  controller: controller,
                  children: tabviewlist,
                ),
              )
            ]),
          )),
    );
  }
}
