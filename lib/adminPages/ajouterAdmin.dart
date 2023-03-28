import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'aceuil.dart';


class ajouterAdmin extends StatefulWidget {
  const ajouterAdmin({Key? key}) : super(key: key);

  @override
  State<ajouterAdmin> createState() => _ajouterAdminState();
}

class _ajouterAdminState extends State<ajouterAdmin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
            child: Text("Ajouter un administrateur ",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.only(top: 35,left: 20,right: 30),
            child: Column(
              children:<Widget> [


                TextField(

                  decoration: InputDecoration(
                      hintText: 'Email',
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
                ),SizedBox(height: 20,),
                TextField(

                  decoration: InputDecoration(
                      hintText: 'Mot de passe',
                      prefixIcon: Icon(Icons.password),
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
                SizedBox(height: 50,),
                Container(
                  height: 40,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.blueAccent,
                    color: Colors.grey,
                    elevation: 7,
                    child: GestureDetector(
                      onTap: () {


                        Navigator.push(context, MaterialPageRoute(builder: (context)=>aceuilPage()));

                      },
                      child: Center(
                        child: Text("Ajouter",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontFamily: 'Montserrat'),),
                      ),
                    ),
                  ),
                ),


              ],
            ),

          ),

        ],
      ),
    );
  }
}
