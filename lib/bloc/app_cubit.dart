import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:stmarystathanasius/model/usermodel2.dart';
import '../constant/compontents.dart';
import '../constant/const.dart';
import 'package:flutter/cupertino.dart';

import '../functuion/sharedprefrenc.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit() : super(AppInitial());
  static AppCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  bool visibility=true;
  void onvisibilty(){
    visibility=false;
    emit(Visibility());
  }
  void offVisibility(){
    visibility=true;
    emit(UnVisibility());
  }


  TextEditingController fnTec= TextEditingController();
  TextEditingController lnTec= TextEditingController();
  TextEditingController unTec= TextEditingController();
  TextEditingController phoneTec= TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC =  TextEditingController();
  TextEditingController malingAddressTec= TextEditingController();
  TextEditingController cityTec= TextEditingController();
  TextEditingController stateTec= TextEditingController();
  TextEditingController zipTec= TextEditingController();


  var token;
  var errorusermsg='Username is already taken!';
  var erroremailmsg='Email is already taken!';
  bool usererror=false;
  bool emailerror = false;
  void SignUp()async{
    final respons = await http.post(Uri.parse(signupUrl),
      body:jsonEncode(<String, String>{
        "firstname":"${fnTec.text}",
        "lastname":"${lnTec.text}",
        "username":"${unTec.text}",
        "phonenumber":"${phoneTec.text}",
        "email":"${emailTEC.text}",
        "password":"${passwordTEC.text}",
        "mallingaddress":"${malingAddressTec.text}",
        "city":"${cityTec.text}",
        "state":"${stateTec.text}",
        "zipcode":"${zipTec.text}"
      }),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    if(respons.statusCode==200){
      //showToast(text: 'Account has been successfully registered', state: ToastState.SUCCESS);
      emailerror=false;
      usererror=false;
      CacheHelper.saveData(key: 'firstname', value: fnTec.text);
      CacheHelper.saveData(key: 'lastname', value: lnTec.text);
      CacheHelper.saveData(key: 'username', value: emailTEC.text);
      CacheHelper.saveData(key: 'emailAddress', value: emailTEC.text);
      CacheHelper.saveData(key: 'phonenumber', value: phoneTec.text);
      CacheHelper.saveData(key: 'city', value: cityTec.text);
      CacheHelper.saveData(key: 'state', value: stateTec.text);
      emit(ValiduserSuccess());
      emit(ValidemailSuccess());
      emit(SignUpSuccess());
    }else if(respons.statusCode==400){
      if(respons.body==errorusermsg){
        usererror=true;
        emailerror=false;
        emit(ValidemailSuccess());
        emit(ValiduserError());
      }
      else if(respons.body==erroremailmsg){
        emailerror=true;
        usererror=false;
        emit(ValiduserSuccess());
        emit(ValidemailError());
      }
    }


    else {
      showToast(text: '${respons.body}', state: ToastState.WARNING);
      print(respons.body);
      emit(SignUpError());
    }
  }




 // User usermodel= User();
  Usermodel usermodel= Usermodel();
  void Login() async{

    final responce = await http.get(Uri.parse('http://walnutssolution.com/api/v1/auth/UserLogin?email=${emailTEC.text}&password=${passwordTEC.text}&token=12345678910'));
    String body= utf8.decode(responce.bodyBytes);
    if(responce.statusCode==200){
      if(responce.body=='the login is failed user name or password is incorrect '){
        showToast(text: 'the login is failed user name or password is incorrect', state: ToastState.ERROR);
        emit(LoginError());
      }else{
        usermodel =  await Usermodel.fromJson(jsonDecode(body)[0]);
        if(usermodel.payment==true){

          print('payment is true');
          CacheHelper.saveData(key: 'picByte',value: usermodel.imageModel!.picByte);
          CacheHelper.saveData(key: 'firstname', value: usermodel.firstname);
          CacheHelper.saveData(key: 'lastname', value: usermodel.lastname);
          CacheHelper.saveData(key: 'username', value: usermodel.username);
          CacheHelper.saveData(key: 'phonenumber', value: usermodel.phonenumber);
          CacheHelper.saveData(key: 'mallingaddress', value: usermodel.mallingaddress);
          CacheHelper.saveData(key: 'city', value: usermodel.city);
          CacheHelper.saveData(key: 'email', value: usermodel.email);
          CacheHelper.saveData(key: 'password', value: usermodel.password);
          CacheHelper.saveData(key: 'state', value: usermodel.state);
          CacheHelper.saveData(key: 'zipcode', value: usermodel.zipcode);
          CacheHelper.saveData(key: 'payment', value: usermodel.payment);
          CacheHelper.saveData(key: 'islogin', value:true);
          emit(LoginAdminSuccess());
        }else{
          if(usermodel.imageModel== null){
            CacheHelper.saveData(key: 'emailAddress', value: emailTEC.text);
            emit(PhotoprofileError());
          }else{print('Helloooooo ${usermodel.imageModel!.picByte}');
          print('payment is false');
          CacheHelper.saveData(key: 'picByte',value: usermodel.imageModel!.picByte);
          CacheHelper.saveData(key: 'firstname', value: usermodel.firstname);
          CacheHelper.saveData(key: 'lastname', value: usermodel.lastname);
          CacheHelper.saveData(key: 'username', value: usermodel.username);
          CacheHelper.saveData(key: 'phonenumber', value: usermodel.phonenumber);
          CacheHelper.saveData(key: 'mallingaddress', value: usermodel.mallingaddress);
          CacheHelper.saveData(key: 'city', value: usermodel.city);
          CacheHelper.saveData(key: 'email', value: usermodel.email);
          CacheHelper.saveData(key: 'password', value: usermodel.password);
          CacheHelper.saveData(key: 'state', value: usermodel.state);
          CacheHelper.saveData(key: 'zipcode', value: usermodel.zipcode);
          CacheHelper.saveData(key: 'payment', value: usermodel.payment);
          CacheHelper.saveData(key: 'islogin', value: true);
          emit(LoginSuccess());}

        }

      }
    } else if(responce.statusCode==504){
      showToast(text: 'Connection on server  Timed Out ', state: ToastState.ERROR);
    }else{
      emit(LoginError());
    }
  }

  void selectUser(String email,password)async{
    final responce = await http.get(Uri.parse('http://walnutssolution.com/api/v1/auth/UserLogin?email=${email}&password=${password}&token=12345678910'));
    String body= utf8.decode(responce.bodyBytes);
    if(responce.statusCode==200){
      if(responce.body=='the login is failed user name or password is incorrect '){
        showToast(text: 'the login is failed user name or password is incorrect', state: ToastState.ERROR);
        emit(SelectUserError());
      }else{
        usermodel =  await Usermodel.fromJson(jsonDecode(body)[0]);
        //print(usermodel.question);
        CacheHelper.saveData(key: 'userpicByte',value: usermodel.imageModel!.picByte);
        CacheHelper.saveData(key: 'userfirstname', value: usermodel.firstname);
        CacheHelper.saveData(key: 'userlastname', value: usermodel.lastname);
        CacheHelper.saveData(key: 'userusername', value: usermodel.username);
        CacheHelper.saveData(key: 'userphonenumber', value: usermodel.phonenumber);
        CacheHelper.saveData(key: 'usermallingaddress', value: usermodel.mallingaddress);
        CacheHelper.saveData(key: 'usercity', value: usermodel.city);
        CacheHelper.saveData(key: 'useremail', value: usermodel.email);
        CacheHelper.saveData(key: 'userpassword', value: usermodel.password);
        CacheHelper.saveData(key: 'userstate', value: usermodel.state);
        CacheHelper.saveData(key: 'userzipcode', value: usermodel.zipcode);
        CacheHelper.saveData(key: 'userQ1', value: usermodel.question![0].question1);
        CacheHelper.saveData(key: 'userQ2', value: usermodel.question![0].question2);
        CacheHelper.saveData(key: 'userQ3', value: usermodel.question![0].question3);
        CacheHelper.saveData(key: 'userQ4', value: usermodel.question![0].question4);
        CacheHelper.saveData(key: 'userQ5', value: usermodel.question![0].question5);
        CacheHelper.saveData(key: 'userQ6', value: usermodel.question![0].question6);
        CacheHelper.saveData(key: 'userQ7', value: usermodel.question![0].question7);
        CacheHelper.saveData(key: 'userQ8', value: usermodel.question![0].question8);
        emit(SelectUserSucess());
      }
    } else if(responce.statusCode==504){
      showToast(text: 'Connection on server  Timed Out ', state: ToastState.ERROR);
    }else{
      emit(SelectUserError());
    }
  }



}


