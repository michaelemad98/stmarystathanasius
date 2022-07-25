import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/app_cubit.dart';
import '../../../constant/compontents.dart';
import '../../../constant/const.dart';
import '../../Widgets/Button/textButton.dart';
import '../../Widgets/inputtextfield.dart';
import '../HomeScreen.dart';
import '../SignupScreen.dart';
import '../uplodprofileScreen/uploadprofileScreen.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return BlocProvider(create: (BuildContext context)=> AppCubit(),
    child: BlocConsumer<AppCubit,AppState>(builder: (BuildContext context,state){
      AppCubit cubit = AppCubit.get(context);
      return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined,color:secondaryColor ,),onPressed: (){Navigator.pop(context);}),
          backgroundColor: Colors.white,
          title: Text('Sign In Screen',style: TextStyle(color: secondaryColor,fontSize: 16,fontStyle: FontStyle.normal),),
          elevation: 0,
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.all(26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                //   Image(image: AssetImage('assets/images/logo.png')),
                Text('Welcmoe\nBack',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900,color: fourtaryColor),),
                SizedBox(height:20 ,),
                defaultTextField(obscureText: false,tec:cubit.emailTEC,hintText: "Email",prefixIcon: Icon(Icons.email,),
                ),
                SizedBox(height:25 ,),
                defaultTextField(obscureText: cubit.visibility,tec:cubit.passwordTEC,hintText: "Password",prefixIcon: Icon(Icons.password,),
                suffixIcon: cubit.visibility
                    ? IconButton(
                    onPressed: () {
                      cubit.onvisibilty();
                    },
                    icon: Icon(Icons.visibility))
                    : IconButton(
                    onPressed: () {
                      cubit.offVisibility();
                    },
                    icon: Icon(Icons.visibility_off)),
                ),
                SizedBox(height:25 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Text('Sign IN',style: TextStyle(fontSize: 20)),
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                    onPressed: (){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              height: height/9,
                              child: new Row(
                                crossAxisAlignment:CrossAxisAlignment.center ,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  new CircularProgressIndicator(),
                                  new Text("Loading..."),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      cubit.Login();
                    },
                  ),)
                ],),
                SizedBox(height: 25,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DefaultTextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                      },
                      text: "I don't have account Sign up",
                      txtColor: fourtaryColor,
                    )
                  ],
                )

              ],
            ),
          )

        ],),);

    },
    listener: (BuildContext context, state){
      if(state is LoginSuccess){
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      }
      else if(state is LoginError){
        Navigator.pop(context);
        showToast(text: 'please try again later', state: ToastState.ERROR);
      }else if(state is LoginAdminSuccess){
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      }
      else if(state is PhotoprofileError){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const UploadProfileScreen()));
      }

    },
    ),
    );
  }
}
/*
 */