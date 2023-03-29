import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_constants.dart';
import '../../../../config/app_styles.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custum_text_field.dart';
import '../../../../widgets/submit_button.dart';
import '../../controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterController controller = Get.put(RegisterController());
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: makeAppBar(title: "Fill in your information"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              makeInput(label: "First Name & Last Name",
                  hint: "First Name & Last Name",
                  controller: controller.full_name),
              makeInput(label: "Address",
                  hint: "Address",
                  controller: controller.adress),
              makeInput(label: "Phone number",
                  hint: "Phone number",
                  controller: controller.phoneNumber),
              makeInput(label: "Email",
                  hint: "Email",
                  controller: controller.email_field),
              makeInput(label: "Password",
                  obscureText: true,
                  hint: "Password",
                  controller: controller.password),
              makeInput(label: "Confirm password",
                  obscureText: true,
                  hint: "Confirm password",
                  controller: controller.confirmPassword),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Upload picture",
                        style: AppStyles.black14W5Style),
                    const SizedBox(height: 20,),
                    Obx(() {
                      return controller.imageURL.value == ""
                          ? GestureDetector(
                        onTap: () =>
                        {
                          controller.chooseSourceUploadPicture(context)
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.secondaryColor10,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.primaryColor,
                          ),

                        ),
                      )
                          : Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.secondaryColor10,
                        ),
                        child: Image.network(controller.imageURL.value,fit: BoxFit.cover),

                      );
                    }),

                  ],
                ),
              ),
              Obx(
                ()=> Row(
                  children: [
                    Checkbox(
                      value: controller.selectedTerms.value,
                      activeColor: AppColors.primaryColor,
                      onChanged: (bool? value) {
                        controller.selectedTerms.value = !controller.selectedTerms.value;
                      },
                    ), //
                    GestureDetector(
                      onTap: ()=>{

                      },
                      child: Text(
                        "Agree to the Terms of Use",
                        style: AppStyles.black12W6Style,
                      ),
                    ), //Text
                  ], //<Widget>[]
                ),
              ),
              SizedBox(height: 5,),
              SubmitButton(label: "Register",
                  onPressed: () => {controller.registerUser()}),
              const SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
