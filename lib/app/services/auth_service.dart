import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';
import 'package:sufi_one/app/models/user_model.dart';
import 'package:collection/collection.dart';

class AuthService {
  final box = GetStorage(); // Local storage
  List<Map<String, dynamic>> dummyUsers = []; // User list from JSON

  /* ----------------------------
   ========== REGISTER ==========
   ---------------------------- */

  Future<bool> register(String name, String email, String password) async {
    try {
      final newUser = UserModel(
        id: 0,
        name: name,
        email: email,
        password: password,
        token: 'dummy-token-${DateTime.now().millisecondsSinceEpoch}',
        address: 'Alamat belum diatur',
        role: 'User',
        phone: '',
      );

      await registerUser(newUser);
      box.write('user', newUser.toJson());

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> registerUser(UserModel newUser) async {
    await loadDummyUsers();

    final exists = dummyUsers.any((user) => user['email'] == newUser.email);
    if (exists) throw Exception("Email sudah digunakan");

    final newId =
        (dummyUsers
            .map((e) => e['id'] as int)
            .fold(0, (prev, curr) => curr > prev ? curr : prev)) +
        1;

    final newUserMap = {
      'id': newId,
      'name': newUser.name,
      'email': newUser.email,
      'token': newUser.token,
      'password': newUser.password,
      'address': newUser.address,
      'role': newUser.role,
      'phone': newUser.phone,
    };

    dummyUsers.add(newUserMap);
    box.write('dummyUsers', dummyUsers);
  }

  /* ----------------------------
   ========== LOGIN ==========
   ---------------------------- */

  Future<UserModel?> login(String email, String password) async {
    if (dummyUsers.isEmpty) {
      await loadDummyUsers();
    }

    final userData = dummyUsers.firstWhereOrNull(
      (user) => user['email'] == email && user['password'] == password,
    );

    if (userData != null) {
      final user = UserModel.fromJson(userData);
      box.write('user', user.toJson());
      return user;
    } else {
      throw Exception("Email atau password salah");
    }
  }
  /* ---------------------------------------
   ========== UPDATE USER PROFILE ==========
   ----------------------------------------- */

  Future<void> updateUserProfile(UserModel updatedUser) async {
    await loadDummyUsers();
    final index = dummyUsers.indexWhere((u) => u['email'] == updatedUser.email);
    if (index != -1) {
      dummyUsers[index] = updatedUser.toJson();
      box.write('dummyUsers', dummyUsers);
      box.write('user', updatedUser.toJson());
    }
  }

  /* ----------------------------
   ========== RESET PASSWORD ==========
   ---------------------------- */

  Future<bool> sendOtp(String email) async {
    await loadDummyUsers();
    final exists = dummyUsers.any((user) => user['email'] == email);
    return exists;
  }

  Future<bool> changePassword(
    String email,
    String oldPassword,
    String newPassword,
  ) async {
    await loadDummyUsers();

    // Temukan index user berdasarkan email dan password lama
    final index = dummyUsers.indexWhere(
      (user) => user['email'] == email && user['password'] == oldPassword,
    );

    if (index != -1) {
      // Update password
      dummyUsers[index]['password'] = newPassword;

      // Simpan perubahan ke GetStorage
      box.write('dummyUsers', dummyUsers);

      // Update juga data user yang sedang login
      final currentUser = getLoggedInUser();
      if (currentUser != null && currentUser.email == email) {
        final updatedUser = currentUser.copyWith(password: newPassword);
        box.write('user', updatedUser.toJson());
      }

      return true;
    } else {
      return false;
    }
  }

  /* ----------------------------
   ========== SESSION ==========
   ---------------------------- */

  UserModel? getLoggedInUser() {
    final data = box.read('user');
    if (data != null) {
      return UserModel.fromJson(data);
    }
    return null;
  }

  bool isLoggedIn() {
    return box.hasData('user');
  }

  void logout() {
    box.remove('user');
  }

  /* ----------------------------
   ========== DUMMY DATA ==========
   ---------------------------- */

  Future<void> loadDummyUsers() async {
    // Coba baca dari GetStorage terlebih dahulu
    final stored = box.read('dummyUsers');
    if (stored != null && stored is List) {
      dummyUsers = List<Map<String, dynamic>>.from(stored);
      return;
    }

    // Jika tidak ada di storage, load dari file JSON
    final jsonString = await rootBundle.loadString(
      'res/dummyData/usermodel/usermodel.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    dummyUsers = jsonData.cast<Map<String, dynamic>>();

    // Simpan pertama kali ke storage
    box.write('dummyUsers', dummyUsers);
  }
}
