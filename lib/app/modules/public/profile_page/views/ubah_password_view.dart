import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/profile_page/controllers/profile_page_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/widgets/bottomnavbar.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class UbahPasswordView extends GetView<ProfilePageController> {
  const UbahPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UbahPasswordForm();
  }
}

class _UbahPasswordForm extends StatefulWidget {
  const _UbahPasswordForm();

  @override
  State<_UbahPasswordForm> createState() => _UbahPasswordFormState();
}

class _UbahPasswordFormState extends State<_UbahPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<ProfilePageController>();

  bool isObscureCurrent = true;
  bool isObscureNew = true;
  bool isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      bottomNavigationBar: BottomNavbar(selectedIndex: 3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Atur Ulang Kata Sandi',
                style: AppTextStyles.bigBody.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.navIcon,
                ),
              ),
              const SizedBox(height: 16),

              // Password Lama
              TextFormField(
                controller: controller.currentPasswordController,
                obscureText: isObscureCurrent,
                decoration: InputDecoration(
                  hintText: 'Password Lama',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscureCurrent
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() => isObscureCurrent = !isObscureCurrent);
                    },
                  ),
                ),
                validator: controller.validateCurrentPassword,
              ),
              const SizedBox(height: 16),

              // Password Baru
              TextFormField(
                controller: controller.newPasswordController,
                obscureText: isObscureNew,
                decoration: InputDecoration(
                  hintText: 'Password Baru',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscureNew ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() => isObscureNew = !isObscureNew);
                    },
                  ),
                ),
                validator: controller.validateNewPassword,
              ),
              const SizedBox(height: 16),

              // Konfirmasi Password Baru
              TextFormField(
                controller: controller.confirmPasswordController,
                obscureText: isObscureConfirm,
                decoration: InputDecoration(
                  hintText: 'Konfirmasi Password Baru',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscureConfirm
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() => isObscureConfirm = !isObscureConfirm);
                    },
                  ),
                ),
                validator: controller.validateConfirmPassword,
              ),
              const SizedBox(height: 24),

              // Tombol Update
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      controller.changePassword();
                    }
                  },
                  child: Text(
                    'Update',
                    style: AppTextStyles.buttonFont.copyWith(
                      fontSize: 18,
                      color: AppColors.bg1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
