import 'package:flutter/material.dart';
import '../config/app_styles.dart';

Widget makeInput({label, obscureText = false,hint,controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 20),
        child:Row(children:[Text(label, style: AppStyles.black14W7Style,), Text("*",style:AppStyles.primary14W7Style)]) ,
      ),
      const SizedBox(height: 10,),
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding:const  EdgeInsets.fromLTRB(20, 10, 20, 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400,),
              borderRadius:const  BorderRadius.all(Radius.circular(10.0)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius:const  BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius:const  BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey.shade400)),
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor: Colors.white24,
            hintText: hint,

        ),

      ),
      const SizedBox(height: 20,),
    ],
  );
}