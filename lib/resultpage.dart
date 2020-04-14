import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'container.dart';
import 'calculatorbrain.dart';

class result extends StatelessWidget {
  result({this.bmi, this.results, this.interpretation});
  final String results;
  final String bmi;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ArchSearch'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('YOUR RESULT',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 5,
            child: reuseable(
              colour: Color(0xFF1D1E33),
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    results,
                    style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmi,
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  child: Center(
                    child: Text('RE-CALCULATE',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 30.0)),
                  ),
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity),
            ),
          )
        ],
      ),
    );
  }
}
