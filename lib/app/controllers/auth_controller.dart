import 'package:get/get.dart';
import 'package:sufi_one/app/models/user_model.dart';
import 'package:sufi_one/app/services/auth_service.dart';

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
    // Hapus data login dari penyimpanan (simulasi logout)
    _authService.logout();
    user.value = null;
  }

  bool get isLoggedIn => user.value != null;

  /// ----------------------------
  /// ========== CHANGE PASSWORD ==========
  /// ----------------------------

  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      isLoading.value = true;

      final currentUser = user.value;
      if (currentUser == null) {
        Get.snackbar('Gagal', 'User belum login');
        return;
      }

      final success = await _authService.changePassword(
        currentUser.email,
        oldPassword,
        newPassword,
      );

      if (success) {
        user.value = _authService.getLoggedInUser(); // refresh
        Get.snackbar('Berhasil', 'Password berhasil diubah');
      } else {
        Get.snackbar('Gagal', 'Password lama salah');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
