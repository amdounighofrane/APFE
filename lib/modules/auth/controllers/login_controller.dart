import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../config/app_constants.dart';
import '../../../helper/base_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/utils.dart';

class LoginController extends GetxController with BaseController {
  late TextEditingController email_field,password;

  @override
  void onInit() {
    super.onInit();
    email_field = TextEditingController();
    password = TextEditingController();
  }


  @override
  void onReady(){
    super.onReady();

  }

  goToRegister() {
    Get.toNamed(AppRoutes.register);
  }

  goToDashboardPage()  {
    if (!Utils.validateEmail(email_field.text.trim())) {
      Utils.showErrorText("Please provide your valid email address.");
      return;
    }
    if (!Utils.validatePassword(password.text.trim())) {
      Utils.showErrorText("Password must be 6 characters long");
      return;
    }
    showLoading();
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email_field.text.trim(), password: password.text.trim())
        .then((value) =>{
      FirebaseFirestore.instance.collection(AppConstants.COLLECTION_USERS)
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .get()
          .then((value) async => {
        hideLoading(),
        //lahna taaml navigation lel dashboard mtaak
      }),
    }).catchError((onError)=>{
      hideLoading(),
      Utils.showErrorText("Your email or password is incorrect")
    });

  }

  goToForgotPassword(){
    Get.toNamed(AppRoutes.forgotPassword);
  }

}