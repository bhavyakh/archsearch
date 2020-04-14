import 'customerpage2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const activecolour = Color(0xFF1D1E33);
const inactivecolour = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ArchSearch'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'LIST OF ALL NEARBY SHOPS',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ), //fix style and bold font size
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => result()));
                },
                child: Container(
                  height: 150,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                  width: 120.0,
                                  height: 120.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg')))),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(' RAJU KI CHAI',
                                      style: TextStyle(
                                          color: Color(0xFFEB1555),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 30.0)),
                                  Text('ADDRESS',
                                      style: TextStyle(
                                          color: Color(0xFF8D8E98),
                                          fontSize: 18.0)),
                                  Text('CONTACT',
                                      style: TextStyle(
                                          color: Color(0xFF8D8E98),
                                          fontSize: 18.0))
                                ]),
                          ],
                        )
                      ]),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
