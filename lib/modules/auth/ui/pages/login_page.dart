import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/app_constants.dart';
import '../../../../config/app_styles.dart';
import '../../../../widgets/custum_text_field.dart';
import '../../../../widgets/submit_button.dart';
import '../../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController controller = Get.put(LoginController());
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 20),
            const Text("SignIn",textAlign: TextAlign.center, style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,

            ),),
            const SizedBox(height: 40),
            makeInput(label: "Email",hint: "Email",controller: controller.email_field),
            makeInput(label: "Password", obscureText: true,hint: "Password",controller: controller.password),
            GestureDetector(
                onTap: ()=>{
                  controller.goToForgotPassword()
                },
                child: Text("Forgot your password ?",style: AppStyles.primary14W7Style)),
            SizedBox(height: 10,),
            SubmitButton(label: "Submit", onPressed: ()=>{controller.goToDashboardPage()}),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text("Don't have an account?"),
                const SizedBox(width: 10,),
                GestureDetector(
                    onTap: ()=> {controller.goToRegister()},
                    child: Text("Register", style: AppStyles.primary14W7Style)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
