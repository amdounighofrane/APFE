import 'package:administrateur/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'modules/auth/bindings/welcome_binding.dart';
import 'modules/auth/ui/pages/welcome_page.dart';
final FirebaseAuth _auth=FirebaseAuth.instance;




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: WelcomeBinding(),
      home:  WelcomePage(),
      getPages: AppPages.pages,
    );
  }
}

