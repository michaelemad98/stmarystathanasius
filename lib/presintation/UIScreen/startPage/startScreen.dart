import 'package:flutter/material.dart';
import 'package:stmarystathanasius/presintation/UIScreen/HomeScreen.dart';
import 'package:stmarystathanasius/presintation/Widgets/Button/defaultbutton.dart';

import '../../../constant/const.dart';
import '../../../functuion/sharedprefrenc.dart';
import '../../Widgets/Button/textButton.dart';
import '../AuthScreens/SignInScreen.dart';
class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool ?islogin;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   islogin = CacheHelper.getData(key: 'islogin');
    if (islogin == null||islogin==false) {
      islogin = false;
    } else {
      islogin = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(padding: EdgeInsets.all(35),child: Image(image: AssetImage('assets/images/start.png'),)),
              SizedBox(height: 30,),
              Text("St. Mary & St. Athanasius",style: TextStyle(color: fourtaryColor,fontWeight: FontWeight.w900,fontSize: 25),),
              SizedBox(height: 1,),
              Text("Coptic Orthodox Church Savage, MD",style: TextStyle(color: secondaryColor,fontWeight: FontWeight.w400,fontSize: 15)),
              SizedBox(height: 30,),
              DefaultButton(onPrimary: Colors.black, primary: primaryColor, onPressed: (){

                islogin! ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())):Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));},
                  text: "Get Started", minimumSizeX: double.infinity, minimumSizeY:40, paddingHorizontal: 16 , fontSize: 20, radius: 35),
              SizedBox(height: 30,),


            ],
          ),
        )
      ],),
    );
  }
}
