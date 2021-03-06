import 'package:bmi_calculator/welcome.dart';
import 'package:flutter/material.dart';

import 'customerpage1.dart';

void main() => runApp(Hackathon());

class Hackathon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
