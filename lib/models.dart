class Token {
  bool success;
  String token;

  Token({this.success, this.token});

  Token.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['token'] = this.token;
    return data;
  }
}

class Shops {
  List<ShopName> detailedEvent;
  Shops({this.detailedEvent});
  factory Shops.fromJson(List<dynamic> parsedJson) {
    List<ShopName> detailedEvent = List<ShopName>();
    detailedEvent = parsedJson.map((i) => ShopName.fromJson(i)).toList();

    return Shops(
      detailedEvent: detailedEvent,
    );
  }
}

class ShopName {
  String what;
  List<String> na;
  String sId;
  String name;
  String email;
  String pincode;
  String password;
  String address;
  String date;
  int iV;
  List<String> slot1;

  ShopName(
      {this.what,
      this.na,
      this.sId,
      this.name,
      this.email,
      this.pincode,
      this.password,
      this.address,
      this.date,
      this.iV,
      this.slot1});

  ShopName.fromJson(Map<String, dynamic> json) {
    what = json['what'];
    na = json['na'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    pincode = json['pincode'];
    password = json['password'];
    address = json['address'];
    date = json['date'];
    iV = json['__v'];
    slot1 = json['slot1'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['what'] = this.what;
    data['na'] = this.na;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['pincode'] = this.pincode;
    data['password'] = this.password;
    data['address'] = this.address;
    data['date'] = this.date;
    data['__v'] = this.iV;
    data['slot1'] = this.slot1;
    return data;
  }
}
