import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:popcorntv/Models/tvshowinfo.dart';
import 'package:popcorntv/utilites/urlconstants.dart';
import 'package:popcorntv/utilites/webservice.dart';
import 'package:sliver_fab/sliver_fab.dart';

class seriesinfo extends StatefulWidget {
  final String imdbid;
  seriesinfo({this.imdbid});
  @override
  _seriesinfoState createState() => _seriesinfoState();
}

class _seriesinfoState extends State<seriesinfo> {
  var response;
  bool _spinner = true;
  String genreText;
  String imdburl;
  double rating;
  Color btncolor;
  Color btnicon;
  Tvshowinfo tvinfo;

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

  Future<void> getdata() async {
    String url = imdbtv + widget.imdbid;
    imdburl = imdbsearchurl + widget.imdbid;
    NetworkHelper networkHelper = NetworkHelper(url);
    response = await networkHelper.getData();
    print(response);

    //final movieinfo = movieinfoFromJson(response);
    tvinfo = Tvshowinfo.fromJson(response);
    print('hekk');
    rating = double.parse(tvinfo.rating.percentage.toString()) / 20.0;
    print(rating);
    genreText = tvinfo.genres.join(',');

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
          iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        ),
        child: Builder(
          builder: (context) => SliverFab(
              floatingWidget: FloatingActionButton(
                backgroundColor: btncolor ?? Colors.black,
                child: Icon(
                  Icons.play_arrow,
                  color: btnicon == btncolor ? Colors.white : btnicon,
                ),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Play Button Pressed'),
                    duration: Duration(milliseconds: 500),
                  ));
                },
              ),
              slivers: <Widget>[
                SliverAppBar(
                  //pinned: true,

                  expandedHeight: 500,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeInImage.assetNetwork(
                      fadeInCurve: Curves.easeInCirc,
                      fadeInDuration: Duration(seconds: 10),
                      placeholder: 'assets/popcorn2.jpeg',
                      image: tvinfo.images.poster ?? '',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
