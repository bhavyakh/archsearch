import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class user extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<user> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController storenameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email,pincode,password,name,address,storename;

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
                      'Get Started!',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 50),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Fill your details',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    onSubmitted: (value) {
                      name = value;
                      setState(() {});
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0)),
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value) {
                      storename = value;
                      setState(() {});
                    },
                    onSubmitted: (value) {
                      storename = value;
                      setState(() {});
                    },
                    controller: storenameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0)),
                      border: OutlineInputBorder(),
                      labelText: 'Store Name',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: addressController,
                    onChanged: (value) {
                      address = value;
                      setState(() {});
                    },
                    onSubmitted: (value) {
                      address = value;
                      setState(() {});
                    },
                    
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0)),
                      border: OutlineInputBorder(),
                      labelText: 'Store Address',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
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
                    
                    controller: emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0)),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                      setState(() {});
                    },
                    onSubmitted: (value) {
                      password = value;
                      setState(() {});
                    },
                    
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
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value) {
                     pincode = value;
                      setState(() {});
                    },
                    onSubmitted: (value) {
                     pincode = value;
                      setState(() {});
                    },
                    
                    controller: pincodeController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0)),
                      border: OutlineInputBorder(),
                      labelText: 'Pincode',
                      labelStyle: TextStyle(color: Colors.white),
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
                      onPressed: () async{
                         await request(email,password,pincode,name,address,storename);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}

request(String email, String password,String pincode,String name,String address,String shopname) async {
  dynamic url = 'https://aqueous-cliffs-40873.herokuapp.com/api/shopkeeper/register';

  Map<String, String> headers = {
    "Content-type": "application/x-www-form-urlencoded"
  };
  Map<String, String> json1 = {"email": email, "password": password,"name":name,"pincode":pincode,"address":address,"shopname":shopname};

  http.Response response = await http.post(url, body: json1, headers: headers);

  if (response.statusCode == 200) {
    var decodeJson = json.decode(response.body);

    print(decodeJson);

    
    return decodeJson;
  } else
    return false;
}