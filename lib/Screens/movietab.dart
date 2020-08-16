import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:popcorntv/Models/moviecatalog.dart';
import 'package:popcorntv/utilites/urlconstants.dart';
import 'package:popcorntv/utilites/webservice.dart';
import 'package:popcorntv/widgets/Thumbdisplay.dart';

class movietab extends StatefulWidget {
  final String sortvalue;
  movietab({this.sortvalue});
  @override
  _movietabState createState() => _movietabState();
}

class _movietabState extends State<movietab> {
  int movielistlength;
  int count = 1;
  int counter;
  bool _spinner = false;
  ScrollController _scrollController = ScrollController();
  List<Moviecatalog> movieslist2 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListlength();
    getData(1);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('hw');
        getData(2);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> getListlength() async {
    NetworkHelper networkHelper = NetworkHelper(movielist);
    var d = await networkHelper.getData() as List;
    counter = d.length;

    setState(() {
      _spinner = false;
    });
  }

  Future<void> getData(int number) async {
    List<Moviecatalog> movieslist = [];
    List<Moviecatalog> movieslist1 = movieslist2;

    if (number == 2) {
      if (count != counter) {
        count++;
      }
    }
    String url =
        movieurl + count.toString() + '?order=-1&sort=' + widget.sortvalue;
    NetworkHelper networkHelper = NetworkHelper(url);
    var response = await networkHelper.getData() as List;

    movieslist = response
        .map<Moviecatalog>((json) => Moviecatalog.fromJson(json))
        .toList();

    if (movieslist1.length > 0 && number == 2) {
      movieslist1 = [...movieslist1, ...movieslist];
    } else {
      movieslist1 = movieslist;
    }
    movieslist2 = movieslist1;
    setState(() {});
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
            opacity: 1,
            child: Container(),
          ),
        ),
      );
    }
    return Scaffold(
        backgroundColor: Color(0xff1F2224),
        body: Scrollbar(
          child: GridView.count(
            controller: _scrollController,
            childAspectRatio: 0.65,
            crossAxisCount: 2,
            children: List.generate(movieslist2.length, (index) {
              // print(movielistlength);
              Moviecatalog moviecatalog = movieslist2[index];
              return Thumbdisplay(
                imdbid: moviecatalog.imdbId,
                title: moviecatalog.title,
                year: moviecatalog.year,
                image_url: moviecatalog.images.poster,
                isShow: false,
              );
            }),
          ),
        ));
  }
}
