import 'package:flutter/material.dart';
import 'package:stmarystathanasius/presintation/UIScreen/SigninSceen.dart';
import 'package:stmarystathanasius/presintation/UIScreen/startPage/startScreen.dart';

import 'functuion/sharedprefrenc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'St. Mary & St. Athanasius',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Comic',
        textTheme: const TextTheme(
          headline1: TextStyle(fontWeight: FontWeight.bold),
          headline2: TextStyle(fontWeight: FontWeight.bold),
          headline3:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          headline4:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
          headline5:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
          headline6:
              TextStyle(fontStyle: FontStyle.italic, color: Colors.amber),
          bodyText2: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
          bodyText1: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      home: StartScreen()
    );
  }
}
