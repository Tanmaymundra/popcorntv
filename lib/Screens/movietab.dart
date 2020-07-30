import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:popcorntv/utilites/launch.dart';
import 'package:popcorntv/utilites/urlconstants.dart';
import 'package:popcorntv/utilites/webservice.dart';
import 'package:sliver_fab/sliver_fab.dart';

class movietab extends StatefulWidget {
  final String imdbid;

  movietab({this.imdbid});

  @override
  _movietabState createState() => _movietabState();
}

class _movietabState extends State<movietab> {
  var response;
  bool _spinner = true;
  List genreText;
  String imdburl;
  double rating;
  Color btncolor;
  Color btnicon;
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
    String url = imdbmovie + widget.imdbid;
    imdburl = imdbsearchurl + widget.imdbid;
    NetworkHelper networkHelper = NetworkHelper(url);
    response = await networkHelper.getData();
    print(response);
    List genres = response['genres'] as List;
    print(genres);
    //var rating1 = double.parse(response['rating']['percentage']);
    //print(rating1);
    // rating = rating1 / 20.0;
    // print(rating);
//    rating = rating1
//
// genreText = genres.join(',');

    PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
        NetworkImage(response['images']['poster']));
    btncolor = palette.dominantColor.color;
    print(btncolor);
    btnicon = palette.vibrantColor.color;
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
            floatingPosition: FloatingPosition(right: 16),
            expandedHeight: 500,
            slivers: <Widget>[
              SliverAppBar(
                //pinned: true,
                expandedHeight: 500,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeInImage.assetNetwork(
                    fadeInCurve: Curves.easeInCirc,
                    fadeInDuration: Duration(seconds: 10),
                    placeholder: 'assets/popcorn2.jpeg',
                    image: response['images']['poster'] ?? '',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 462,
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 25),
                          Text(
                            response['title'],
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              RatingBarIndicator(
                                rating: rating ?? 4.45,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 18.0,
                                direction: Axis.horizontal,
                              ),
                              SizedBox(width: 15),
                              Icon(
                                Icons.add_circle,
                                color: Colors.greenAccent,
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text(
                                response['year'],
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(' • ', style: TextStyle(fontSize: 12)),
                              Text(
                                response['runtime'] + ' Mins',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(' • ', style: TextStyle(fontSize: 12)),
                              Text('Genres', style: TextStyle(fontSize: 12))
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            response['synopsis'],
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 25),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RaisedButton.icon(
                                  color: Colors.blueGrey,
                                  onPressed: () {
                                    Launching().openurl(response['trailer']);
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(response['trailer']),
                                    ));
                                  },
                                  icon: Icon(
                                    Icons.videocam,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  label: Text(
                                    'TRAILER',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                RaisedButton.icon(
                                  color: Colors.blueGrey,
                                  icon: Icon(
                                    Icons.rate_review,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  label: Text(
                                    'Review',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    String imdburl =
                                        imdbsearchurl + widget.imdbid;
                                    Launching().openurl(imdburl);
                                  },
                                  onLongPress: () {
                                    String url = imdbsearchurl + widget.imdbid;
                                    Clipboard.setData(ClipboardData(text: url));
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('IMDB Url Copied'),
                                    ));
                                  },
                                ),
                                RaisedButton.icon(
                                  color: Colors.blueGrey,
                                  icon: Icon(
                                    Icons.link,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    String magnet = response['torrents']['en']
                                        ['720p']['url'];
                                    Clipboard.setData(
                                        ClipboardData(text: magnet));
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Magnet Link Copied'),
                                    ));
                                  },
                                  label: Text(
                                    'Magnet',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ]),
                          Divider(
                            color: Colors.white,
                          ),
                          Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(
                                  Icons.subtitles,
                                  color: Colors.white,
                                ),
                                title: Text('English'),
                              ),
                              Divider(
                                color: Colors.white,
                                indent: 60,
                              ),
                              ListTile(
                                leading: Icon(Icons.high_quality,
                                    color: Colors.white),
                                title: Text('720p'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
