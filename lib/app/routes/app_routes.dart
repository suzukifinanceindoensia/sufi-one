import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/bindings/login_binding.dart';
import 'package:sufi_one/app/modules/public/bindings/register_binding.dart';
import '../modules/public/views/splash_view.dart';
import '../modules/public/views/home_view.dart';
import '../modules/public/views/homepage_cust_view.dart';
import '../modules/public/views/mobile_collection.dart'; // Ensure MobileCollection is correctly imported
import '../modules/public/views/login_view.dart';
import '../modules/public/views/register_view.dart';

class AppRoutes {
  static const splash = '/';
  static const publicHome = '/public/home';
  static const homepageCust = '/public/homepage_cust_view';
  static const mobileCollection = '/public/mobile_collection'; // New route
  static const catalog = '/public/catalog';
  static const login = '/public/login';
  static const register = '/public/register';

  static final pages = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: publicHome, page: () => PublicHomePage()),
    GetPage(name: homepageCust, page: () => HomepageCust()),
    GetPage(name: mobileCollection, page: () => MobileCollection()), // New page
    GetPage(name: login, page: () => LoginPage(),binding: LoginBinding()),
    GetPage(name: register, page: () => RegisterPage(),binding: RegisterBinding()),
  ];
}
