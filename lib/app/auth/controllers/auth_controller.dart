import 'package:get/get.dart';
import 'package:sufi_one/app/auth/models/user_model.dart';
import 'package:sufi_one/app/auth/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService =
      AuthService(); // Service untuk login/logout & data user

  var isLoading = false.obs; // Observable untuk loading state
  var user = Rxn<UserModel>(); // Observable nullable user

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus(); // Cek status login saat controller dibuat
  }

  void checkLoginStatus() {
    final loggedUser = _authService.getLoggedInUser();
    if (loggedUser != null) {
      user.value = loggedUser;
    }
  }

  /// ----------------------------
  /// ========== REGISTER ==========
  /// ----------------------------

  Future<void> register(String name, String email, String password) async {
    try {
      isLoading.value = true;

      final success = await _authService.register(name, email, password);
      if (!success) return;

      final newUser = _authService.getLoggedInUser();
      user.value = newUser;

      Get.snackbar('Sukses', 'Registrasi berhasil');
    } catch (e) {
      rethrow; // Biarkan error ditangani oleh pemanggil
    } finally {
      isLoading.value = false;
    }
  }

  /// ----------------------------
  /// ========== LOGIN ==========
  /// ----------------------------

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      final loggedUser = await _authService.login(email, password);
      user.value = loggedUser;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// ----------------------------
  /// ========== LOGOUT ==========
  /// ----------------------------

  void logout() {
    _authService.logout();
    user.value = null;
  }

  bool get isLoggedIn => user.value != null;
}
