import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/public/widgets/appbar.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/public/widgets/bottomnavbar.dart';
import 'package:sufi_one/app/modules/public/controllers/profile_page_controller.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfilePageController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(controller),
            const SizedBox(height: 16),
            _buildProfileMenu(controller),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(selectedIndex: 3),
    );
  }

  Widget _buildProfileHeader(ProfilePageController controller) {
    return Container(
      color: AppColors.bg1,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: const AssetImage('res/images/sufismart.png'),
            backgroundColor: AppColors.bg2,
          ),
          const SizedBox(height: 8),
          Obx(
            () => Text(
              'Hello, ${controller.username.value}',
              style: AppTextStyles.medBody.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoColumn('Role', controller.role),
              Container(
                height: 24,
                child: const VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                  width: 32,
                ),
              ),
              _buildInfoColumn('Cabang', controller.cabang),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, RxString value) {
    return Column(
      children: [
        Text(label, style: AppTextStyles.smallBody),
        Obx(() => Text(value.value, style: AppTextStyles.smallBody)),
      ],
    );
  }

  Widget _buildProfileMenu(ProfilePageController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.bg1,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMenuSection('Account', [
            _buildProfileMenuItem(
              'Edit Profile',
              () => _showEditProfileDialog(),
            ),
            _buildProfileMenuItem('Pesanan Saya', () {}),
            _buildProfileMenuItem('Bantuan', () {}),
          ]),
          const Divider(),
          _buildMenuSection('General', [
            _buildProfileMenuItem('Privacy & Policy', () {}),
            _buildProfileMenuItem('Term of Service', () {}),
            _buildProfileMenuItem('Rate App', () {}),
          ]),
        ],
      ),
    );
  }

  Widget _buildMenuSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.smallBody),
        const SizedBox(height: 8),
        ...items,
      ],
    );
  }

  Widget _buildProfileMenuItem(String title, VoidCallback onTap) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: AppTextStyles.medBody),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }

  void _showEditProfileDialog() {
    showGeneralDialog(
      context: Get.context!,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder:
          (context, _, __) => Material(
            type: MaterialType.transparency,
            child: _buildBlurDialog(child: _EditProfileDialog()),
          ),
    );
  }

  Widget _buildBlurDialog({required Widget child}) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),
        ),
        Center(child: child),
      ],
    );
  }
}

class _EditProfileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField('Name'),
            const SizedBox(height: 12),
            _buildTextField('Telephone'),
            const SizedBox(height: 12),
            _buildTextField('Email'),
            const SizedBox(height: 12),
            _buildTextField('Alamat', maxLines: 3),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showChangePasswordDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.button,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text(
                'Change Password',
                style: TextStyle(color: AppColors.bg1),
              ),
            ),
            SizedBox(height: 16), // Memberikan jarak antar tombol
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.button,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Save', style: TextStyle(color: AppColors.bg1)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Value',
        border: const OutlineInputBorder(),
      ),
    );
  }

  void _showChangePasswordDialog() {
    showGeneralDialog(
      context: Get.context!,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder:
          (context, _, __) => Material(
            type: MaterialType.transparency,
            child: ProfilePageView()._buildBlurDialog(
              child: _ChangePasswordDialog(),
            ),
          ),
    );
  }
}

class _ChangePasswordDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfilePageController controller = Get.find();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Change Password', style: AppTextStyles.medBodyBold),
            const SizedBox(height: 16),
            _buildPasswordField(
              'Current Password',
              onChanged: (value) => controller.newPassword.value = value,
            ),
            const SizedBox(height: 12),
            _buildPasswordField(
              'New Password',
              onChanged: (value) => controller.newPassword.value = value,
            ),
            const SizedBox(height: 12),
            _buildPasswordField(
              'Confirm New Password',
              onChanged: (value) => controller.confirmPassword.value = value,
            ),
            Obx(
              () =>
                  controller.passwordErrorMessage.value.isNotEmpty
                      ? Text(
                        controller.passwordErrorMessage.value,
                        style: TextStyle(color: Colors.red),
                      )
                      : Container(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: controller.acceptTerms.value,
                    onChanged:
                        (value) =>
                            controller.acceptTerms.value = value ?? false,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Tindakan ke Terms & Conditions
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'I accept the terms\n',
                        style: AppTextStyles.smallBody,
                        children: [
                          TextSpan(
                            text: 'Read our T&Cs',
                            style: AppTextStyles.smallBody.copyWith(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.validatePasswords();
                if (controller.passwordErrorMessage.value.isEmpty) {
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text(
                'Confirm Change Password',
                style: TextStyle(color: AppColors.bg1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(
    String label, {
    int maxLines = 1,
    required Function(String) onChanged,
  }) {
    return TextField(
      obscureText: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Value',
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
