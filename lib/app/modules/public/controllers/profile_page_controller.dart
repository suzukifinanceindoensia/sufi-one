import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  // Variabel untuk data profil
  RxString username = 'Admin'.obs;
  RxString role = 'Marketing'.obs;
  RxString cabang = 'Suzuki Head office'.obs;

  // Metode untuk memperbarui data profil
  void updateUsername(String newUsername) {
    username.value = newUsername;
  }

  void updateRole(String newRole) {
    role.value = newRole;
  }

  void updateCabang(String newCabang) {
    cabang.value = newCabang;
  }

  @override
  void onInit() {
    super.onInit();
    // contoh ambil data dari API
  }

  @override
  void onClose() {
    super.onClose();
  }
}
