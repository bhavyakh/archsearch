import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'models.dart';
import 'customerpage2.dart';

const activecolour = Color(0xFF1D1E33);
const inactivecolour = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Shops _shops;
  ShopName _shopName;

  requestData() async {
    String url = 'https://aqueous-cliffs-40873.herokuapp.com/api/customer/cur';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      _shops = Shops.fromJson(decodedJson);
      setState(() {});
    }
  }

  @override
  void initState() {
    requestData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ArchSearch'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                _shopName = _shops.detailedEvent[index];
                return Container(
                  height : MediaQuery.of(context).size.height * 0.78,
                  child: ListView(
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => result()));
                            },
                            child: Container(
                              height: 150,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Container(
                                                width: 120.0,
                                                height: 120.0,
                                                decoration: new BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: new DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: new NetworkImage(
                                                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'))),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                          _shopName.name ??
                                                              'SHOP NAME',
                                                          style: TextStyle(
                                                              color:
                                                                  Color(
                                                                      0xFFEB1555),
                                                              fontWeight:
                                                                  FontWeight.w900,
                                                              fontSize: 30.0)),
                                                      Text(
                                                          _shopName.address ??
                                                              'ADDRESS',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF8D8E98),
                                                              fontSize: 18.0)),
                                                      Text(
                                                          _shopName.pincode ??
                                                              'PINCODE',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF8D8E98),
                                                              fontSize: 18.0))
                                                    ])))
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
              }),
        ));
  }
}
