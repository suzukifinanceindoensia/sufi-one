import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  RxString username = 'Admin'.obs;
  RxString role = 'Marketing'.obs;
  RxString cabang = 'Suzuki Head office'.obs;
  RxString name = ''.obs;
  RxString telephone = ''.obs;
  RxString email = ''.obs;
  RxString alamat = ''.obs;

  RxBool acceptTerms = false.obs;

  RxString newPassword = ''.obs;
  RxString confirmPassword = ''.obs;
  RxString passwordErrorMessage = ''.obs;

  void updateUsername(String newUsername) {
    username.value = newUsername;
  }

  void updateRole(String newRole) {
    role.value = newRole;
  }

  void updateCabang(String newCabang) {
    cabang.value = newCabang;
  }

  void updateName(String newName) {
    name.value = newName;
  }

  void updateTelephone(String newTelephone) {
    telephone.value = newTelephone;
  }

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  void updateAlamat(String newAlamat) {
    alamat.value = newAlamat;
  }

  void toggleAcceptTerms(bool? value) {
    acceptTerms.value = value ?? false;
  }

  void validatePasswords() {
    if (newPassword.value != confirmPassword.value) {
      passwordErrorMessage.value = 'Password baru tidak sesuai!';
    } else {
      passwordErrorMessage.value = '';
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
