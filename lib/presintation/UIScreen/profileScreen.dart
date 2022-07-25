import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stmarystathanasius/presintation/UIScreen/prayersDaily.dart';
import 'package:stmarystathanasius/presintation/UIScreen/startPage/startScreen.dart';

import '../../constant/const.dart';
import '../../functuion/sharedprefrenc.dart';
import '../Widgets/Button/defaultbutton.dart';


class ProfielScreen extends StatefulWidget {
  const ProfielScreen({Key? key}) : super(key: key);

  @override
  _ProfielScreenState createState() => _ProfielScreenState();
}

class _ProfielScreenState extends State<ProfielScreen> {
  var locationmessage;


  String? firstname,lastname,username,emailaddress,phonenumber,city,state,picByte;
  var image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstname= CacheHelper.getData(key: 'firstname')??'';
    lastname= CacheHelper.getData(key: 'lastname')??'';
    username= CacheHelper.getData(key: 'username')??'';
    emailaddress= CacheHelper.getData(key: 'email')??'';
    phonenumber= CacheHelper.getData(key: 'phonenumber')??'';
    city= CacheHelper.getData(key: 'city')??'';
    state= CacheHelper.getData(key: 'state')??'';
    picByte = CacheHelper.getData(key: 'picByte') ?? '';
    var blob = picByte;
    if (blob != null) {
      // Only decode if blob is not null to prevent crashes
      image = base64.decode(blob);
    } else {
      print("Error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgroundimage.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   title: Text('Profile',style: Theme.of(context).textTheme.bodyText2,),
        //   centerTitle: true,
        //   leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios),),
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: CircleAvatar(
                    backgroundImage: MemoryImage(image),radius: 70,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(alignment: AlignmentDirectional.center,
                        width: double.infinity,
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Text('$firstname',style: TextStyle(fontSize: 25),),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        width: double.infinity,
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Text('$lastname',style: TextStyle(fontSize: 25),),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text('$username',style: TextStyle(fontSize: 25),),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text('$emailaddress',style: TextStyle(fontSize: 25),),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text('$phonenumber',style: TextStyle(fontSize: 25),),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Flexible(
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        width: double.infinity,
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Text('$city',style: TextStyle(fontSize: 25),),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        width: double.infinity,
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Text('$state',style: TextStyle(fontSize: 25),),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PrayersDaily()));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 60,
                          child: (Image(
                            image: AssetImage('assets/images/pray.png'),
                          )),
                        ),
                        Text(
                          'daily prayers',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                ),
                locationmessage == null ? Text('') : Text('$locationmessage'),
                Row(
                  children: [],
                ),
                DefaultButton(
                  paddingHorizontal: 12,
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StartScreen()));
                    CacheHelper.saveData(key: 'islogin', value: false);
                  },
                  text: 'Logout',
                  fontSize: 16,
                  minimumSizeY: 40,
                  radius: 12,
                  minimumSizeX: 200,
                  primary: TertiaryColor,
                  onPrimary: whiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
