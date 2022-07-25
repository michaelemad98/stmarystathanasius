import 'package:flutter/material.dart';

import '../../constant/const.dart';
class InputTextFaield extends StatelessWidget {
  final TextEditingController tec;
  final String hintText;
  final IconButton? suffixIcon;
  final bool obscureText ;
  final onChange;
  final valdition;
  final onClick;
  const InputTextFaield({Key? key, required this.tec,
    required this.hintText,
    this.suffixIcon,
    this.valdition,
    this.onChange,
    required this.obscureText,
    required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

      ),
      child: TextFormField(
        controller: tec,
        obscureText: obscureText,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),

        decoration: InputDecoration(
          fillColor: Colors.white,
          errorStyle: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),
          errorBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.white, width: 0.0),
          ),
          focusedErrorBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.blue, width: 0.0),
          ),
          border: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          suffixIcon: suffixIcon,
        ),
        validator: valdition,
        onChanged: onChange,
        onSaved: onClick,
      ),
    );
  }
}
class defaultTextField extends StatelessWidget {
   TextEditingController tec;
   String ? hintText;
   bool obscureText;
  Icon ?prefixIcon;
   IconButton ? suffixIcon;
   final onChange;
   final valdition;
   final onClick;
  defaultTextField({Key? key,required this.tec,this.hintText,required this.obscureText,this.prefixIcon,this.suffixIcon,this.onChange,this.onClick,this.valdition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: tec,
    obscureText:obscureText ,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon:prefixIcon,
      suffixIcon:suffixIcon,
    ),
    );
  }
}

