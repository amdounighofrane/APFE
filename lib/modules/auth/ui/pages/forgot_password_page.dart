import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/app_constants.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custum_text_field.dart';
import '../../../../widgets/submit_button.dart';
import '../../controllers/forgot_password_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());
   ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: makeAppBar(title: "Reset password"),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            makeInput(label: "Email",hint: "Email",controller: controller.email_field),
            const SizedBox(height: 20,),
            SubmitButton(label: "Submit", onPressed: ()=>{controller.handleForgotPassword()}),
          ],
        ),
      ),
    );
  }
}
