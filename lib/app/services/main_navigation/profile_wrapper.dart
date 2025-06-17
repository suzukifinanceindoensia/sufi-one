import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/controllers/auth_controller.dart';
import 'package:sufi_one/app/modules/public/profile_page/views/profile_page_view.dart';
import 'package:sufi_one/app/modules/public/login/views/login_view.dart';

class ProfileWrapper extends StatelessWidget {
  const ProfileWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil instance dari AuthController
    final authController = Get.find<AuthController>();

    return Obx(() {
      // Jika user sudah login, tampilkan ProfilePageView, jika tidak, LoginPage
      return authController.user.value != null
          ? const ProfilePageView()
          : const LoginPage();
    });
  }
}
