// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

List<Usermodel> usermodelFromJson(String str) => List<Usermodel>.from(json.decode(str).map((x) => Usermodel.fromJson(x)));

String usermodelToJson(List<Usermodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usermodel {
  Usermodel({
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
    this.imageFk,
    this.token,
    this.payment,
    this.islogin,
    this.keywords,
    this.question,
    this.imageModel,
    this.article,
    this.roles,
    this.mobile,
  });

  int ?id;
  String? firstname;
  String ?lastname;
  String ?username;
  String ?phonenumber;
  String ?mallingaddress;
  String ?city;
  String ?email;
  String ?password;
  String ?state;
  String ?zipcode;
  int ?imageFk;
  String ?token;
  bool ?payment;
  bool ?islogin;
  List<dynamic>? keywords;
  List<Question>? question;
  ImageModel ?imageModel;
  List<dynamic>? article;
  List<Role> ?roles;
  dynamic ?mobile;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    username: json["username"],
    phonenumber: json["phonenumber"],
    mallingaddress: json["mallingaddress"],
    city: json["city"],
    email: json["email"],
    password: json["password"],
    state: json["state"],
    zipcode: json["zipcode"],
    imageFk: json["image_fk"],
    token: json["token"],
    payment: json["payment"],
    islogin: json["islogin"],
    keywords: List<dynamic>.from(json["keywords"].map((x) => x)),
    question: List<Question>.from(json["question"].map((x) => Question.fromJson(x))),
    imageModel: json["imageModel"] == null ? null : ImageModel.fromJson(json["imageModel"]),
    article: List<dynamic>.from(json["article"].map((x) => x)),
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    mobile: json["mobile"],
  );

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
    "image_fk": imageFk,
    "token": token,
    "payment": payment,
    "islogin": islogin,
    "keywords": List<dynamic>.from(keywords!.map((x) => x)),
    "question": List<dynamic>.from(question!.map((x) => x.toJson())),
    "imageModel": imageModel == null ? null : imageModel!.toJson(),
    "article": List<dynamic>.from(article!.map((x) => x)),
    "roles": List<dynamic>.from(roles!.map((x) => x.toJson())),
    "mobile": mobile,
  };
}

class ImageModel {
  ImageModel({
    this.id,
    this.name,
    this.type,
    this.email,
    this.fkIdId,
    this.picByte,
  });

  int ? id;
  String ?name;
  String ?type;
  String ?email;
  dynamic ?fkIdId;
  String ?picByte;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    email: json["email"],
    fkIdId: json["fk_id_id"],
    picByte: json["picByte"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "email": email,
    "fk_id_id": fkIdId,
    "picByte": picByte,
  };
}

class Question {
  Question({
    this.id,
    this.question1,
    this.question2,
    this.question3,
    this.question4,
    this.question5,
    this.question6,
    this.question7,
    this.question8,
    this.questionIdFk,
    this.emailFk,
  });

  int ?id;
  String? question1;
  String ?question2;
  String ?question3;
  String ?question4;
  String ?question5;
  String ?question6;
  String ?question7;
  String ?question8;
  int ?questionIdFk;
  String? emailFk;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    question1: json["question1"],
    question2: json["question2"],
    question3: json["question3"],
    question4: json["question4"],
    question5: json["question5"],
    question6: json["question6"],
    question7: json["question7"],
    question8: json["question8"],
    questionIdFk: json["question_id_fk"],
    emailFk: json["email_fk"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question1": question1,
    "question2": question2,
    "question3": question3,
    "question4": question4,
    "question5": question5,
    "question6": question6,
    "question7": question7,
    "question8": question8,
    "question_id_fk": questionIdFk,
    "email_fk": emailFk,
  };
}

class Role {
  Role({
    this.id,
    this.name,
  });

  int? id;
  String ?name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
