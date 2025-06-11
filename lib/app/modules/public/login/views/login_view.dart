import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';
import 'package:sufi_one/app/modules/public/login/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/public/widgets/bottomnavbar.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/controllers/auth_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Obx(() {
      final isLoggedIn = authController.user.value != null;
      return Scaffold(
        backgroundColor: AppColors.bg1,
        appBar: const SuzukiFinanceAppBarWsidebar(),
        drawer: isLoggedIn ? Drawer(child: AppSidebar()) : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Form(
              key: controller.loginKey,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Header 1
                    Text(
                      "Selamat Datang Kembali",
                      style: AppTextStyles.medBodyBold.copyWith(
                        color: AppColors.button,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),

                    // Header 2
                    Text(
                      "Masukkan email dan kata sandi anda yang terdaftar di aplikasi SUFI-ONE",
                      style: AppTextStyles.medBody.copyWith(
                        color: AppColors.button,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // Email
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: controller.validateEmail,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: controller.passwordController,
                          obscureText: !controller.isPasswordVisible.value,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                          ),
                          validator: controller.validatePassword,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Login button
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                        style: AppButtonStyle.primaryButtonStyle(),
                        onPressed: controller.login,
                        child: Text("Login", style: AppTextStyles.buttonFont),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Forget Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () => Get.toNamed(HomeRoutes.forgotPassword),
                        child: Text(
                          'Lupa Password?',
                          style: AppTextStyles.smallBody,
                        ),
                      ),
                    ),

                    // Register
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () => Get.toNamed(HomeRoutes.registerpage),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Belum punya akun? ',
                                style: AppTextStyles.smallBody,
                              ),
                              TextSpan(
                                text: 'Daftar sekarang',
                                style: AppTextStyles.smallBodyBold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavbar(selectedIndex: 3),
      );
    });
  }
}
