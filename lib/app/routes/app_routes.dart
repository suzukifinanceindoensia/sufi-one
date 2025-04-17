import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/bindings/forgot_password_binding.dart';
import 'package:sufi_one/app/modules/public/bindings/login_binding.dart';
import 'package:sufi_one/app/modules/public/bindings/register_binding.dart';
import 'package:sufi_one/app/modules/public/views/forgot_password_view.dart';
import '../modules/public/views/splash_view.dart';
import '../modules/public/views/home_view.dart';
import '../modules/public/views/login_view.dart';
import '../modules/public/views/register_view.dart';

class AppRoutes {
  static const splash = '/';
  static const publicHome = '/public/home';
  static const catalog = '/public/catalog';
  static const login = '/public/login';
  static const register = '/public/register';
  static const forgotPassword = '/public/forgot_password';

  static final pages = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: publicHome, page: () => PublicHomePage()),
    GetPage(name: login, page: () => LoginPage(),binding: LoginBinding()),
    GetPage(name: register, page: () => RegisterPage(),binding: RegisterBinding()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordPage(),binding: ForgotPasswordBinding()),
  ];
}


