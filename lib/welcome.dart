import 'customerpage1.dart';
import 'shopkeeperpage1.dart';
import 'package:flutter/material.dart';
import 'customersignup.dart';
import 'shopkeepersignup.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'models.dart';

class welcome extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<welcome> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ArchSearch', style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'ArchSearch',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 50),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                      setState(() {});
                    },
                    onSubmitted: (value) {
                      email = value;
                      setState(() {});
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0)),
                      border: OutlineInputBorder(),
                      labelText: 'Email ID',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                      setState(() {});
                    },
                    onSubmitted: (val) {
                      password = val;
                      print(val);
                      setState(() {});
                    },
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30.0)),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        suffixStyle: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Color(0xFFEB1555),
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () async {
                        var result = await request(email, password);
                        if(result!= null){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InputPage()));
                        }
                    
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Login as Customer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Color(0xFFEB1555),
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () async {
                         var result = await request2(email, password);
                        if(result){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => shopkeeper()));
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Login as User',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Color(0xFFEB1555),
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => customer()));
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Sign Up as Customer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Color(0xFFEB1555),
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => user()));
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Sign Up as User',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}

request(String email, String password) async {
  dynamic url = 'https://aqueous-cliffs-40873.herokuapp.com/api/customer/login';

  Map<String, String> headers = {
    "Content-type": "application/x-www-form-urlencoded"
  };
  Map<String, String> json1 = {"email": email, "password": password};

  http.Response response = await http.post(url, body: json1, headers: headers);

  if (response.statusCode == 200) {
    var decodeJson = json.decode(response.body);

    String token = decodeJson['token'].toString();

    
    return token;
  } else
    return false;
}

request2(String email, String password) async {
  dynamic url = 'https://aqueous-cliffs-40873.herokuapp.com/api/shopkeeper/login';

  Map<String, String> headers = {
    "Content-type": "application/x-www-form-urlencoded"
  };
  Map<String, String> json1 = {"email": email, "password": password};

  http.Response response = await http.post(url, body: json1, headers: headers);

  if (response.statusCode == 200) {
    var decodeJson = json.decode(response.body);

    String token = decodeJson['token'].toString();
    print(token);
    
    return decodeJson;
  } else
    return false;
}



getData() async {
  String url = 'https://aqueous-cliffs-40873.herokuapp.com/api/customer/cur2';
  var response = await http.get(url);
  print(response.body);
}

