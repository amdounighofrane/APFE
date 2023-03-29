import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../helper/base_controller.dart';
import '../../../routes/app_routes.dart';

class WelcomeController extends GetxController with BaseController {
  @override
  void onInit() {
    super.onInit();
    Timer(
        const Duration(seconds: 3),
        () => {
              if (FirebaseAuth.instance.currentUser != null)
                {
                  if (FirebaseAuth.instance.currentUser!.email ==
                      "admin@admin.com")
                    {}
                  else
                    {}
                }
              else
                {
                  Get.offAllNamed(AppRoutes.login),
                }
            });
  }

}
