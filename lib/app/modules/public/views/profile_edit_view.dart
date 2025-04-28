import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/public/widgets/appbar.dart';
import 'package:sufi_one/app/modules/public/controllers/profile_edit_controller.dart';

class ProfileEditView extends StatelessWidget {
  ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileEditController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBar(),
      body: SingleChildScrollView(
        // Add this to make the body scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => controller.name.value = value,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: AppColors.navBackground,
              ),
            ),

            // Phone TextFormField
            TextFormField(
              onChanged: (value) => controller.phone.value = value,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: AppColors.navBackground,
              ),
            ),

            // Email TextFormField
            TextFormField(
              onChanged: (value) => controller.email.value = value,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: AppColors.navBackground,
              ),
            ),

            // Address TextFormField
            TextFormField(
              onChanged: (value) => controller.address.value = value,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: AppColors.navBackground,
              ),
            ),

            // Toggle button for password change
            ElevatedButton(
              onPressed: () {
                controller.togglePasswordChange();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.button,
                foregroundColor: AppColors.bg1,
              ),
              child: Obx(() {
                return Text(
                  controller.isPasswordChange.value
                      ? 'Cancel Password Change'
                      : 'Change Password',
                );
              }),
            ),

            // Conditional password fields based on toggle
            Obx(() {
              if (controller.isPasswordChange.value) {
                return Column(
                  children: [
                    // Current Password
                    TextFormField(
                      obscureText: true,
                      onChanged:
                          (value) => controller.currentPassword.value = value,
                      decoration: InputDecoration(
                        labelText: 'Current Password',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: AppColors.navBackground,
                      ),
                    ),

                    // New Password
                    TextFormField(
                      obscureText: true,
                      onChanged:
                          (value) => controller.newPassword.value = value,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: AppColors.navBackground,
                      ),
                    ),

                    // Confirm Password
                    TextFormField(
                      obscureText: true,
                      onChanged:
                          (value) => controller.confirmPassword.value = value,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: AppColors.navBackground,
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            }),

            // Save button
            ElevatedButton(
              onPressed: () {
                controller.saveProfile();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.button,
                foregroundColor: AppColors.bg1,
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
