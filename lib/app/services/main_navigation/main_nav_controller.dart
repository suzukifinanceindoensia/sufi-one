import 'package:get/get.dart';
import 'package:sufi_one/app/controllers/auth_controller.dart';

class MainNavigationController extends GetxController {
  var selectedIndex = 0.obs; // Observable untuk index tab yang aktif

  // autentikasi
  final authController = Get.find<AuthController>();

  /// Ganti index tab BottomNavbar
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
