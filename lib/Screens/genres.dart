import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:popcorntv/Models/Genre.dart';

class genrelist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Genre().getLength(),
        itemBuilder: (BuildContext context, int index) {
          print(index);
          return ListTile(
              // focusColor: Colors.white12,
              //   title: Text(returngenres[index].mLabel),
              //child: Text(returngenres[index].getLabelId()),
              // onTap: () {
              // Scaffold.of(context).showSnackBar(SnackBar(
              //  content: Text(returngenres[index].getKey()),
              //             )
              );
        },
      ),
    );
    //  },
    // ),
    // );
  }
}
