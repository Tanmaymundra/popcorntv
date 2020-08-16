import 'package:flutter/material.dart';
import 'package:popcorntv/Models/tvshowinfo.dart';

class Seasonlist extends StatefulWidget {
  final Tvshowinfo tvinfo;
  final int season;
  Seasonlist({this.tvinfo, this.season});

  @override
  _SeasonlistState createState() => _SeasonlistState();
}

class _SeasonlistState extends State<Seasonlist> {
  List<Episode> episodelist = [];

  void getseason() async {
    for (var i = 0; i <= widget.tvinfo.episodes.length; i++) {
      if (widget.tvinfo.episodes[i].season == widget.season) {
        episodelist.add(widget.tvinfo.episodes[i]);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getseason();
    Comparator<Episode> comparator = (a, b) => a.episode.compareTo(b.episode);
    episodelist.sort(comparator);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episodelist.length,
      itemBuilder: (BuildContext context, int index) {
        int temp = index + 1;
        return ListTile(
          leading: Text('E $temp'),
          title: Text(episodelist[index].title),
          // onTap: Navigator.of(context).push(MaterialPageRoute(context)),
        );
      },
    );
  }
}
