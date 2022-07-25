// To parse this JSON data, do
//
//     final answer = answerFromJson(jsonString);

import 'dart:convert';

class Answer {
  Answer({
    this.question1,
    this.question2,
    this.question3,
    this.question4,
    this.question5,
    this.question6,
    this.question7,
    this.question8,
    this.user,
  });

  String ?question1;
  String ?question2;
  String ?question3;
  String ?question4;
  String ?question5;
  String ?question6;
  String ?question7;
  String ?question8;
  User ?user;
  Map<String, dynamic> toJson() => {
    "question1": question1,
    "question2": question2,
    "question3": question3,
    "question4": question4,
    "question5": question5,
    "question6": question6,
    "question7": question7,
    "question8": question8,
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
    this.phonenumber,
    this.mallingaddress,
    this.city,
    this.email,
    this.password,
    this.state,
    this.zipcode,
    this.token,
    this.payment,
    this.islogin,
    this.keywords,
    this.article,
    this.roles,
    this.hibernateLazyInitializer,
    this.mobile,
  });

  int ?id;
  String? firstname;
  String? lastname;
  String? username;
  String? phonenumber;
  String? mallingaddress;
  String? city;
  String ?email;
  String ?password;
  String ?state;
  String ?zipcode;
  String ?token;
  bool ?payment;
  bool ?islogin;
  List<dynamic> ?keywords;
  List<dynamic> ?article;
  List<Role>? roles;
  HibernateLazyInitializer? hibernateLazyInitializer;
  dynamic? mobile;



  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "username": username,
    "phonenumber": phonenumber,
    "mallingaddress": mallingaddress,
    "city": city,
    "email": email,
    "password": password,
    "state": state,
    "zipcode": zipcode,
    "token": token,
    "payment": payment,
    "islogin": islogin,
    "mobile": mobile,
  };
}

class HibernateLazyInitializer {
  HibernateLazyInitializer();


  Map<String, dynamic> toJson() => {
  };
}

class Role {
  Role({
    this.id,
    this.name,
  });

  int ?id;
  String? name;


  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
