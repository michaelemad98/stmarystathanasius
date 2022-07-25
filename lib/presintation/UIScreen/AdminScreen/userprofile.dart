import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../constant/const.dart';
import '../../../functuion/sharedprefrenc.dart';
class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  var size, height, width;
  String ?picByte,firstname,lastname,phonenumber,email,city,state,question1,question2,question3,question4,question5,question6,question7,question8;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstname= CacheHelper.getData(key: 'userfirstname')??'';
    picByte= CacheHelper.getData(key: 'userpicByte')??'';
    lastname= CacheHelper.getData(key: 'userlastname')??'';
    phonenumber= CacheHelper.getData(key: 'userphonenumber')??'';
    email= CacheHelper.getData(key: 'useremail')??'';
    city= CacheHelper.getData(key: 'usercity')??'';
    state= CacheHelper.getData(key: 'userstate')??'';
    question1= CacheHelper.getData(key: 'userQ1')??'';
    question2= CacheHelper.getData(key: 'userQ2')??'';
    question3= CacheHelper.getData(key: 'userQ3')??'';
    question4= CacheHelper.getData(key: 'userQ4')??'';
    question5= CacheHelper.getData(key: 'userQ5')??'';
    question6= CacheHelper.getData(key: 'userQ6')??'';
    question7= CacheHelper.getData(key: 'userQ7')??'';
    question8= CacheHelper.getData(key: 'userQ8')??'';
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    var image;
    var blob = picByte;
    if (blob != null) {
      // Only decode if blob is not null to prevent crashes
      image = base64.decode(blob);
    } else {
      print("Error");
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: height/7,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60),
                      )
                  ),
                  child: Row(
                    children: [IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_ios,color: whiteColor,))],
                  ),
                ),

                Container(margin: EdgeInsets.only(top: 40),
                  child: Center(child:
                  CircleAvatar(radius:70,backgroundImage:MemoryImage(image)),),
                )
              ],
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("${firstname} $lastname",style: TextStyle(fontSize: 20)),
                  Text('$email',style: TextStyle(fontSize: 20),),
                  Text('$phonenumber',style: TextStyle(fontSize: 20),),
                  Text('$city, $state',style: TextStyle(fontSize: 20),),],
              ),
            ),
            Container(

              margin: EdgeInsets.only(left: 25,right: 25),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                  color: Colors.cyan
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Father Confession : $question1',style: TextStyle(fontSize: 20,color: whiteColor),),
                    Text('Last Confession : $question2',style: TextStyle(fontSize: 20,color: whiteColor),),
                    Text('Last Liturgy : $question3',style: TextStyle(fontSize: 20,color: whiteColor),),
                    Text('Last Visit Chruch : $question4',style: TextStyle(fontSize: 20,color: whiteColor),),
                    Text('Church Activities : $question6',style: TextStyle(fontSize: 20,color: whiteColor),),
                    Text('Last hymns : $question7',style: TextStyle(fontSize: 20,color: whiteColor),),
                    Text('Last Trip : $question8',style: TextStyle(fontSize: 20,color: whiteColor),),
                  ],),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
