import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/login/controllers/forgot_password_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20),

                // Header 1
                Text(
                  "Lupa Password",
                  style: AppTextStyles.medBodyBold.copyWith(
                    color: AppColors.navIcon,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                // Header 2
                Text(
                  "Jika ingin memulihkan akun anda, silahkan isi email valid yang sudah terdaftar dalam aplikasi SUFI-ONE",
                  style: AppTextStyles.medBody.copyWith(
                    color: AppColors.navIcon,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // Email Field
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 16),
                    suffixIcon: Icon(Icons.email_outlined),
                    border: UnderlineInputBorder(), // garis bawah
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.iconDefault),
                    ),
                  ),
                  validator: controller.validateEmail,
                ),

                const SizedBox(height: 30),

                // Button
                Obx(
                  () => ElevatedButton(
                    style: AppButtonStyle.primaryButtonStyle(),
                    onPressed:
                        controller.isButtonEnabled.value
                            ? controller.resetPassword
                            : null,
                    child:
                        controller.isButtonEnabled.value
                            ? Text(
                              'Reset Password',
                              style: AppTextStyles.buttonFont.copyWith(
                                fontSize: 16,
                                color: AppColors.bg1,
                              ),
                            )
                            : const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
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
