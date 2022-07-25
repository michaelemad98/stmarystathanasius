import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';

import '../../bloc/app_cubit.dart';
import '../../constant/compontents.dart';
import '../../constant/const.dart';
import '../Widgets/Button/defaultbutton.dart';
import '../Widgets/Button/textButton.dart';
import '../Widgets/inputtextfield.dart';
import 'AuthScreens/SignInScreen.dart';
import 'HomeScreen.dart';
import 'SigninSceen.dart';
import 'questionScreen/questions.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fnTec = TextEditingController();
  TextEditingController lnTec = TextEditingController();
  TextEditingController phoneTec = TextEditingController();
  TextEditingController emailTec = TextEditingController();
  TextEditingController passwordTec = TextEditingController();
  TextEditingController confirmpasswordTec = TextEditingController();
  TextEditingController addressTec = TextEditingController();
  TextEditingController cityTec = TextEditingController();
  TextEditingController stateTec = TextEditingController();
  TextEditingController zipTec = TextEditingController();
  late String _firstname;
  late String _lasttname;
  late String _username;
  late String _phone;
  late String _email;
  late String _password;
  late String _confirmpassword;
  late String _address;
  late String _city;
  late String _State;
  late String _zip;
  final _formKey = GlobalKey<FormState>();
  bool usernameerror=false ;
  bool emailerror=false ;


  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'for Church Membership',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.left,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: BlocProvider(
                          create: (BuildContext context) => AppCubit(),
                          child: BlocConsumer<AppCubit, AppState>(
                              listener: (BuildContext context, state) {
                            if (state is SignUpSuccess) {

                              showToast(text: 'User Registered Successfully', state: ToastState.SUCCESS);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           QuestionsScreen()));

                            } else if (state is SignUpError) {
                              Navigator.pop(context);
                              showToast(
                                  text: 'please try again later',
                                  state: ToastState.ERROR);
                            }
                            else if (state is ValiduserError){
                              Navigator.pop(context);
                              usernameerror = true;
                            }
                            else if(state is ValidemailError){
                              Navigator.pop(context);
                              emailerror = true;
                            }
                            else if(state is ValidemailSuccess){
                              Navigator.pop(context);
                              emailerror=false;
                            }
                            else if (state is ValiduserSuccess){
                              Navigator.pop(context);
                              usernameerror=false;
                            }
                          }, builder: (BuildContext context, state) {
                            AppCubit cubit = AppCubit.get(context);
                            return Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: defaultTextField(
                                          obscureText: false,
                                          hintText: 'Fist Name',
                                          onClick: (value) {
                                            _firstname = value;
                                          },
                                          valdition: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter First name';
                                            } else {
                                              return null;
                                            }
                                          },
                                          tec: cubit.fnTec,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: defaultTextField(
                                          obscureText: false,
                                          hintText: 'Last Name',
                                          onClick: (value) {
                                            _lasttname = value;
                                          },
                                          valdition: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter Last name';
                                            } else {
                                              return null;
                                            }
                                          },
                                          tec: cubit.lnTec,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  defaultTextField(
                                    obscureText: false,
                                    hintText: 'Username',
                                    onClick: (value) {
                                      _username = value;
                                    },
                                    valdition: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Username';
                                      }
                                      else {
                                        return null;
                                      }
                                    },
                                    tec: cubit.unTec,
                                  ),
                                  usernameerror?Text('${cubit.errorusermsg}',style: TextStyle(color: Colors.amber),):Container(),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  defaultTextField(
                                    obscureText: false,
                                    hintText: 'Phone Number',
                                    onClick: (value) {
                                      _phone = value;
                                    },
                                    valdition: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Phone Number';
                                      } else {
                                        return null;
                                      }
                                    },
                                    tec: cubit.phoneTec,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  defaultTextField(
                                    obscureText: false,
                                    hintText: 'Email Address',
                                    onClick: (value) {
                                      _email = value;
                                    },
                                    valdition: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Email Address';
                                      } else if (!value.contains('@')) {
                                        return 'Email Addres is not valid';
                                      }
                                      else {
                                        return null;
                                      }
                                    },
                                    tec: cubit.emailTEC,
                                  ),
                                  emailerror?Text(cubit.erroremailmsg,style: TextStyle(color: Colors.amber),):Container(),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  defaultTextField(
                                    obscureText: true,
                                    hintText: 'Password',
                                    onClick: (value) {
                                      _password = value;
                                    },
                                    valdition: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Password';
                                      } else {
                                        return null;
                                      }
                                    },
                                    tec: cubit.passwordTEC,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  defaultTextField(
                                    obscureText: true,
                                    hintText: 'Confirm Password',
                                    onClick: (value) {
                                      _confirmpassword = value;
                                    },
                                    valdition: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Confirm Password';
                                      } else {
                                        return null;
                                      }
                                    },
                                    tec: confirmpasswordTec,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  defaultTextField(
                                    obscureText: false,
                                    hintText: 'Mailing Address',
                                    onClick: (value) {
                                      _address = value;
                                    },
                                    valdition: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Mailing Address';
                                      } else {
                                        return null;
                                      }
                                    },
                                    tec: cubit.malingAddressTec,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: defaultTextField(
                                          obscureText: false,
                                          hintText: 'City',
                                          onClick: (value) {
                                            _city = value;
                                          },
                                          valdition: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter Phone Number';
                                            } else {
                                              return null;
                                            }
                                          },
                                          tec: cubit.cityTec,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: defaultTextField(
                                          obscureText: false,
                                          hintText: 'State',
                                          onClick: (value) {
                                            _State = value;
                                          },
                                          valdition: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter State';
                                            } else {
                                              return null;
                                            }
                                          },
                                          tec: cubit.stateTec,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  defaultTextField(
                                    obscureText: false,
                                    hintText: 'Zip Code',
                                    onClick: (value) {
                                      _zip = value;
                                    },
                                    valdition: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Zip Code';
                                      } else {
                                        return null;
                                      }
                                    },
                                    tec: cubit.zipTec,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Center(
                                      child: DefaultButton(
                                    paddingHorizontal: 12,
                                    onPressed: () {

                                      if (_formKey.currentState!.validate()) {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>QuestionsScreen(),));
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
                                        cubit.SignUp();

                                      }
                                    },
                                    text: 'SUBMIT NOW',
                                    fontSize: 16,
                                    minimumSizeY: 40,
                                    radius: 12,
                                    minimumSizeX: 200,
                                    primary: TertiaryColor,
                                    onPrimary: whiteColor,
                                  )),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Having Account ?',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:fourtaryColor,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      DefaultTextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignInScreen()));
                                        },
                                        text: 'Sign IN Now',
                                        txtColor: fourtaryColor,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
