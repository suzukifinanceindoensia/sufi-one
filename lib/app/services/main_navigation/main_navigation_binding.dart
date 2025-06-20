import 'package:get/get.dart';
import 'package:sufi_one/app/controllers/auth_controller.dart';
import 'package:sufi_one/app/modules/public/about/controllers/about_controller.dart';
import 'package:sufi_one/app/modules/public/about/controllers/contact_controller.dart';
import 'package:sufi_one/app/modules/public/homepage/controllers/homepage_cust_controller.dart';
import 'package:sufi_one/app/modules/public/login/controllers/login_controller.dart';
import 'package:sufi_one/app/modules/public/profile_page/controllers/profile_page_controller.dart';
import 'main_nav_controller.dart';

class MainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainNavigationController>(
      MainNavigationController(),
      permanent: true,
    );

    Get.lazyPut<AboutController>(() => AboutController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<HomepageCustController>(() => HomepageCustController());

    // Controller login (fenix = akan dibuat ulang saat dibutuhkan setelah dihapus)
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);

    Get.lazyPut<ProfilePageController>(
      () => ProfilePageController(),
      fenix: true,
    );

    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
