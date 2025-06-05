import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';
import 'package:sufi_one/app/auth/models/user_model.dart';

class AuthService {
  final box = GetStorage(); // GetStorage untuk menyimpan data lokal
  List<Map<String, dynamic>> dummyUsers = []; // Data user dummy JSON

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

    // Cek jika email sudah terdaftar
    final exists = dummyUsers.any((user) => user['email'] == newUser.email);
    if (exists) throw Exception("Email sudah digunakan");

    // Generate ID baru
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
      'password': newUser.password, // Simpan password dari input
    };

    dummyUsers.add(newUserMap);
    box.write('dummyUsers', dummyUsers); // Simpan ke GetStorage
  }

  /// ----------------------------
  /// ========== LOGIN ==========
  /// ----------------------------

  Future<UserModel?> login(String email, String password) async {
    if (dummyUsers.isEmpty) {
      await loadDummyUsers(); // Load data jika belum tersedia
    }

    final userData = dummyUsers.firstWhere(
      (user) => user['email'] == email && user['password'] == password,
      orElse: () => {},
    );

    if (userData.isNotEmpty) {
      final user = UserModel.fromJson(userData);
      box.write('user', user.toJson());
      return user;
    } else {
      throw Exception("Email atau password salah");
    }
  }

  /// ----------------------------
  /// ========== OTP / RESET PASSWORD ==========
  /// ----------------------------

  Future<bool> sendOtp(String email) async {
    await loadDummyUsers();
    final exists = dummyUsers.any((user) => user['email'] == email);
    return exists;
  }

  /// ----------------------------
  /// ========== USER SESSION ==========
  /// ----------------------------

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

  /// ----------------------------
  /// ========== DUMMY DATA ==========
  /// ----------------------------

  Future<void> loadDummyUsers() async {
    final jsonString = await rootBundle.loadString(
      'res/dummyData/usermodel/usermodel.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    dummyUsers = jsonData.cast<Map<String, dynamic>>();
  }
}
