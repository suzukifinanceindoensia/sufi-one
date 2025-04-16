import 'package:get/get.dart';
import '../modules/public/views/splash_view.dart';
import '../modules/public/views/home_view.dart';
import '../modules/public/views/homepage_cust_view.dart';
import '../modules/public/views/mobile_collection.dart'; // Ensure MobileCollection is correctly imported

class AppRoutes {
  static const splash = '/';
  static const publicHome = '/public/home';
  static const homepageCust = '/public/homepage_cust_view';
  static const mobileCollection = '/public/mobile_collection'; // New route

  static final pages = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: publicHome, page: () => PublicHomePage()),
    GetPage(name: homepageCust, page: () => HomepageCust()),
    GetPage(name: mobileCollection, page: () => MobileCollection()), // New page
  ];
}
