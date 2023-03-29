import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../helper/base_controller.dart';
import '../../../utils/utils.dart';

class ForgotPasswordController extends GetxController with BaseController {
  late TextEditingController email_field;

  @override
  void onInit() {
    super.onInit();
    email_field = TextEditingController();
  }


  @override
  void onReady(){
    super.onReady();

  }

  handleForgotPassword() {
    if (!Utils.validateEmail(email_field.text.trim())) {
      Utils.showErrorText("Please provide your valid email address.");
      return;
    }
    showLoading();
    FirebaseAuth.instance.sendPasswordResetEmail(email: email_field.text.trim())
    .then((value) => {
      hideLoading(),
    Utils.showSuccessText("Check your email"),
    });
  }


}