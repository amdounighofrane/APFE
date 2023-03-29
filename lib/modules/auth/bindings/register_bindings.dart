import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import '../controllers/welcome_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}