import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:popcorntv/Models/tvcatalog.dart';
import 'package:popcorntv/utilites/urlconstants.dart';
import 'package:popcorntv/utilites/webservice.dart';
import 'package:popcorntv/widgets/Thumbdisplay.dart';

class seriestab extends StatefulWidget {
  final String sortvalue;
  seriestab({this.sortvalue});
  @override
  _seriestabState createState() => _seriestabState();
}

class _seriestabState extends State<seriestab> {
  int movielistlength;
  int count = 1;
  int counter;
  bool _spinner = false;
  ScrollController _scrollController = ScrollController();
  List<Tvcatalog> serieslist2 = [];
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
    NetworkHelper networkHelper = NetworkHelper(tvlist);
    var d = await networkHelper.getData() as List;
    counter = d.length;

    setState(() {
      _spinner = false;
    });
  }

  Future<void> getData(int number) async {
    List<Tvcatalog> serieslist = [];
    List<Tvcatalog> serieslist1 = serieslist2;

    if (number == 2) {
      if (count != counter) {
        count++;
      }
    }
    String url =
        tvurl + count.toString() + '?order=-1&sort=' + widget.sortvalue;
    NetworkHelper networkHelper = NetworkHelper(url);
    var response = await networkHelper.getData() as List;

    serieslist =
        response.map<Tvcatalog>((json) => Tvcatalog.fromJson(json)).toList();

    if (serieslist1.length > 0 && number == 2) {
      serieslist1 = [...serieslist1, ...serieslist];
    } else {
      serieslist1 = serieslist;
    }
    serieslist2 = serieslist1;
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
            children: List.generate(serieslist2.length, (index) {
              // print(movielistlength);
              Tvcatalog tvcatalog = serieslist2[index];
              return Thumbdisplay(
                  imdbid: tvcatalog.imdbId,
                  title: tvcatalog.title,
                  year: tvcatalog.year,
                  image_url: tvcatalog.images.poster ?? tvcatalog.images.banner,
                  isShow: true);
            }),
          ),
        ));
  }
}
