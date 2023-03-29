import 'package:get/get.dart';
import '../modules/auth/bindings/forgot_password_binding.dart';
import '../modules/auth/bindings/login_bindings.dart';
import '../modules/auth/bindings/register_bindings.dart';
import '../modules/auth/bindings/welcome_binding.dart';
import '../modules/auth/ui/pages/forgot_password_page.dart';
import '../modules/auth/ui/pages/login_page.dart';
import '../modules/auth/ui/pages/register_page.dart';
import '../modules/auth/ui/pages/welcome_page.dart';
import 'app_routes.dart';



class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.welcome,
      page: () =>  WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () =>  LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () =>  RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}