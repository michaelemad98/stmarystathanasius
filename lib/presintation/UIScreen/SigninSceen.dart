// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stmarystathanasius/presintation/UIScreen/uplodprofileScreen/uploadprofileScreen.dart';
//
//
// import '../../bloc/app_cubit.dart';
// import '../../constant/compontents.dart';
// import '../../constant/const.dart';
// import '../Widgets/Button/defaultbutton.dart';
// import '../Widgets/Button/textButton.dart';
// import '../Widgets/inputtextfield.dart';
// import 'HomeScreen.dart';
// import 'SignupScreen.dart';
//
// class SignINScreen extends StatefulWidget {
//   const SignINScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignINScreenState createState() => _SignINScreenState();
// }
//
// class _SignINScreenState extends State<SignINScreen> {
//
//   TextEditingController emailTec = TextEditingController();
//   TextEditingController passwordTec = TextEditingController();
//   late String _email;
//   late String _password;
//   var image;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     var blob =imageprofile;// Question mark after the keyword to make it nullable
//
// // Declare variable to save the image later
//
//
//     if (blob != null) {
//       // Only decode if blob is not null to prevent crashes
//       image = base64.decode(blob);
//       print('Success');
//     }
//     else{
//       print("Error");
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image:  AssetImage("assets/images/backgroundimage.png"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: ListView(
//           children: [
//             SafeArea(
//               child: Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Image(image: AssetImage('assets/images/logo.png')),
//                    //  Container( child: new Image.memory(image)),
//                     Text(
//                       'Register',
//                       style: Theme.of(context).textTheme.headline6,
//                       textAlign: TextAlign.center,
//                     ),
//                     Text(
//                       'for Church Membership',
//                       style: Theme.of(context).textTheme.bodyText2,
//                       textAlign: TextAlign.left,
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(20),
//
//                       child: BlocProvider(
//                         create: (BuildContext context)=> AppCubit(),
//                         child: BlocConsumer<AppCubit,AppState>(
//                           listener:  (BuildContext context, state){
//                             if(state is LoginSuccess){
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
//                             }
//                             else if(state is LoginError){
//                               showToast(text: 'please try again later', state: ToastState.ERROR);
//                             }else if(state is LoginAdminSuccess){
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
//                             }
//                             else if(state is PhotoprofileError){
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>const UploadProfileScreen()));
//                             }
//
//                           },
//                           builder:  (BuildContext context, state){
//                             AppCubit cubit = AppCubit.get(context);
//                             return Column(
//                               children: [
//                                 InputTextFaield(
//                                   obscureText: false,
//                                   hintText: 'Email Address',
//                                   onClick: (value) {
//                                     _email = value;
//                                   },
//                                   tec: cubit.emailTEC,
//                                 ),
//                                 SizedBox(
//                                   height: 6,
//                                 ),
//                                 InputTextFaield(
//                                   obscureText: true,
//                                   hintText: 'Password',
//                                   onClick: (value) {
//                                     _password = value;
//                                   },
//                                   tec: cubit.passwordTEC,
//                                 ),
//
//                                 Center(
//                                     child: DefaultButton(
//                                       paddingHorizontal: 12,
//                                       onPressed: () {
//
//                                         cubit.Login();
//                                       },
//                                       text: 'SUBMIT NOW',
//                                       fontSize: 16,
//                                       minimumSizeY: 40,
//                                       radius: 12,
//                                       minimumSizeX: 200,
//                                       primary: TertiaryColor,
//                                       onPrimary: whiteColor,
//                                     )),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Text(
//                                       'New User ?',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         color: whiteColor,
//                                       ),
//                                     ),
//                                     DefaultTextButton(onPressed: () {
//                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
//                                     }, text: 'Sign Up Now',txtColor: primaryColor,)
//                                   ],)
//                               ],
//                             );
//                           },
//                         ),
//                       )
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
