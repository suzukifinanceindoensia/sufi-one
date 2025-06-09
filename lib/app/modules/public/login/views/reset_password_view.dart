import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/public/login/controllers/reset_password_controller.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(35),
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20),

                Text(
                  'Masukkan password baru anda.',
                  style: AppTextStyles.medBodyBold.copyWith(
                    color: AppColors.button,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // New Password
                Obx(
                  () => TextFormField(
                    controller: controller.newPasswordController,
                    obscureText: controller.isNewPasswordHidden.value,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border: const UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.iconDefault),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isNewPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          controller.isNewPasswordHidden.toggle();
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Confirm Password
                Obx(
                  () => TextFormField(
                    controller: controller.confirmPasswordController,
                    obscureText: controller.isConfirmPasswordHidden.value,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: const UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.iconDefault),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isConfirmPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          controller.isConfirmPasswordHidden.toggle();
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Konfirmasi password tidak boleh kosong';
                      }
                      if (value != controller.newPasswordController.text) {
                        return 'Konfirmasi password tidak cocok';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),

                ElevatedButton(
                  style: AppButtonStyle.primaryButtonStyle(),
                  onPressed: controller.changePassword,
                  child: Text(
                    'Change Password',
                    style: AppTextStyles.buttonFont,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
