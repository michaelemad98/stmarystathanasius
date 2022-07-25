import 'dart:convert';

import 'package:dio/dio.dart';


import '../constant/const.dart';
import 'package:http/http.dart' as http;

import '../model/usermodel2.dart';


class FeatchUser{
  var data=[];
  List<Usermodel> result=[];
  Future<List<Usermodel>> getMemberList({String?query})async{
    var url= Uri.parse('http://walnutssolution.com/api/v1/AllUsers');
    final responce = await http.post(url);
    try{
      if(responce.statusCode==200){
        data= json.decode(responce.body);
        result=data.map((e) => Usermodel.fromJson(e)).toList();
        if (query!=null){
          result = result.where((element) => element.username!.toLowerCase().contains(query.toLowerCase())).toList();
        }
    }else{
        print(responce.body);
      }
  }catch(e){
      print(e.toString());
    }
    return result;
    }
}

class AllMembersServive{
  late Dio dio;
  List memberslist=[];
  AllMembersServive(){
    BaseOptions options = BaseOptions(
      baseUrl: AllUsersUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20*1000,
      receiveTimeout: 20*1000,
    );
    dio = Dio(options);

  }
  Future<List<dynamic>>getAllUser()async{
    try {
      Response response = await dio.post('AllUsers');
    //  print(response.data.toString());
      response.data.forEach((e)=>memberslist.add(e));
      print(memberslist);
      return response.data;
    }catch(e){
      print(e.toString());
      return[];
    }
  }
}

class AllAnswersService{
  late Dio dio;
  AllAnswersService(){
    BaseOptions options = BaseOptions(
      baseUrl: AllUsersUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20*1000,
      receiveTimeout: 20*1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>>getAllAnsewer()async{
    try {
      Response response = await dio.post('AllAnswers');
      print(response.data.toString());
      return response.data;
    }catch(e){
      print(e.toString());
      return[];
    }
  }
}