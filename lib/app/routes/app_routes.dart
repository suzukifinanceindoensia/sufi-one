import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/bindings/forgot_password_binding.dart';
import 'package:sufi_one/app/modules/public/bindings/login_binding.dart';
import 'package:sufi_one/app/modules/public/bindings/register_binding.dart';
import 'package:sufi_one/app/modules/public/views/forgot_password_view.dart';
import 'package:sufi_one/app/modules/public/views/home_view.dart';
import 'package:sufi_one/app/modules/public/views/homepage_cust_view.dart';
import 'package:sufi_one/app/modules/public/views/login_view.dart';
import 'package:sufi_one/app/modules/public/views/register_view.dart';
import 'package:sufi_one/app/modules/public/views/splash_view.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobile_collection_view.dart';
import 'package:sufi_one/app/modules/mobcol/bindings/mobile_collection_binding.dart';

class AppRoutes {
  static const splash = '/';
  static const publicHome = '/public/home';
  static const homepageCust = '/public/homepage_cust_view';
  static const mobileCollection = '/public/mobile_collection';
  static const catalog = '/public/catalog';
  static const login = '/public/login';
  static const register = '/public/register';
  static const forgotPassword = '/public/forgot_password';

  static final pages = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: publicHome, page: () => PublicHomePage()),
    GetPage(name: homepageCust, page: () => HomepageCust()),
    GetPage(
      name: mobileCollection,
      page: () => MobileCollection(),
      binding: MobileCollectionBinding(), // ✅ binding ditambahkan
    ),
    GetPage(name: login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
      name: register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
