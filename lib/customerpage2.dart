import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class result extends StatelessWidget {
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
          Container(
            height: 150,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('SHOP 1',
                            style: TextStyle(
                                color: Color(0xFFEB1555),
                                fontWeight: FontWeight.w900,
                                fontSize: 50.0)),
                        Text('ADDRESS',
                            style: TextStyle(
                                color: Color(0xFF8D8E98), fontSize: 18.0)),
                        Text('CONTACT',
                            style: TextStyle(
                                color: Color(0xFF8D8E98), fontSize: 18.0))
                      ]),
                ]),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xFF1D1E33),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('LIST OF THINGS NOT AVAILABE',
                          style: TextStyle(
                              color: Color(0xFFEB1555),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('1.Apple',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('2.Banana',
                          style: TextStyle(color: Colors.white, fontSize: 18.0))
                    ]),
                  ]),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('BOOK SLOTS',
                          style: TextStyle(
                              color: Color(0xFFEB1555),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                    ]),
                  ]),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
