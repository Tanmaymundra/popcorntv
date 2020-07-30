import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popcorntv/widgets/Thumbdisplay.dart';

class Grid_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.65,
      children: List.generate(10, (index) {
        return Thumbdisplay(index: index);
      }),
    );
  }
}
