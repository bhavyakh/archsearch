import 'package:flutter/material.dart';

class reuseable extends StatelessWidget {
  reuseable({this.colour, this.cardchild});
  final Color colour;
  final cardchild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
