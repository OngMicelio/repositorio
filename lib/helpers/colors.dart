import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorList extends StatelessWidget {
  final int index;
  List<Color> colors = [
    Colors.black,
    Colors.blue.shade800,
    Colors.purple.shade800,
    Colors.red.shade800,
    Colors.yellow.shade600,
    Colors.green.shade800,
    Colors.grey,
    Colors.purple.shade300,
    Colors.orange.shade800,
  ];
  ColorList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors[index],
    );
  }
}
