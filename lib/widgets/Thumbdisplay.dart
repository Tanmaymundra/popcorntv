import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:popcorntv/Screens/movieinfotab.dart';
import 'package:popcorntv/Screens/seriesinfo.dart';

class Thumbdisplay extends StatelessWidget {
  Thumbdisplay(
      {this.index,
      this.image_url,
      this.title,
      this.year,
      this.imdbid,
      this.isShow});

  final String year;
  final String imdbid;
  final String title;
  final String image_url;
  final int index;
  final bool isShow;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        if (isShow) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => seriesinfo(imdbid: imdbid)));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => movieinfotab(imdbid: imdbid)));
        }
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 1.5, horizontal: 1.5),
            child: Opacity(
              opacity: 0.7,
              child: FadeInImage.assetNetwork(
                height: deviceHeight * 0.65,
                fadeInCurve: Curves.easeInCirc,
                fit: BoxFit.cover,
                placeholder: 'assets/popcorn2.jpeg',
                image: image_url ?? '',
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  year,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
