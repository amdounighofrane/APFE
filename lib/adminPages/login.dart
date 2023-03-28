import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'aceuil.dart';
import 'ajouterAdmin.dart';

class loginPgae extends StatefulWidget {
  const loginPgae({Key? key}) : super(key: key);

  @override
  State<loginPgae> createState() => _loginPgaeState();
}

class _loginPgaeState extends State<loginPgae> {
  bool passwordObscured=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:<Widget> [
          Container(
            padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
            child: Text("Bienvenue ",style:TextStyle(fontSize: 40,fontWeight:FontWeight.bold),),
          ),
          Container(
            padding: EdgeInsets.only(top: 35,left: 20,right: 30),
            child: Column(
              children:<Widget> [
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Mot de passe',
                      prefixIcon: Icon(Icons.mail),
                      labelStyle: TextStyle(
                        fontFamily: 'Montserra',
                        fontWeight: FontWeight.bold,
                        color:Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  obscureText:passwordObscured,
                  decoration: InputDecoration(
                    hintText: 'Mot de passe',
                    prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          passwordObscured=!passwordObscured;
                        });
                      },
                      icon: Icon( passwordObscured
                         ? Icons.visibility_off
                          :Icons.visibility

                      ),),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),

              ],
            ),

          ),
          SizedBox(height: 55,),
          Container(
            height: 40,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.blueAccent,
              color: Colors.grey,
              elevation: 7,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>aceuilPage()));

                },
                child: Center(
                  child: Text("connexion",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontFamily: 'Montserrat'),),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            alignment: Alignment(0,1),
            padding: EdgeInsets.only(top: 15,left: 20),
    child: GestureDetector(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ajouterAdmin()));

    },


            child: Text("Ajouter ",style: TextStyle(color: Colors.black87,fontWeight:FontWeight.bold,fontFamily: 'Montserrat',decoration:TextDecoration.underline),),
    ),
          ),


         

        ],

      ),
    );
  }
}
