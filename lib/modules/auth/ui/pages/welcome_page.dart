

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/app_constants.dart';
import '../../../../config/app_styles.dart';
import '../../../../widgets/submit_button.dart';
import '../../controllers/welcome_controller.dart';

class WelcomePage extends StatelessWidget {
  WelcomeController controller = Get.put(WelcomeController());
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: Column(
          children:  [
            const Spacer(),
            Image.asset(AppConstants.welcomeImage,height: 250,),
            const Spacer(),
          ],
        ) ,
      ),
    );
  }
}