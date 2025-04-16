import 'package:get/get.dart';
import '../modules/public/views/splash_view.dart';
import '../modules/public/views/home_view.dart';
import '../modules/public/views/login_view.dart';

class AppRoutes {
  static const splash = '/';
  static const publicHome = '/public/home';
  static const catalog = '/public/catalog';
  static const login = '/public/login';

  static final pages = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: publicHome, page: () => PublicHomePage()),
    GetPage(name: login, page: () => LoginPage()),
  ];
}


