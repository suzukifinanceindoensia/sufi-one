import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/public/controllers/profile_page_controller.dart';

class ProfileEditView extends StatelessWidget {
  ProfileEditView({super.key});
  final controller = Get.find<ProfilePageController>();

  void _showEditDialog({
    required BuildContext context,
    required String title,
    required String initialValue,
    required Function(String) onSave,
  }) {
    final tempController = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Edit $title'),
            content: TextField(
              controller: tempController,
              decoration: InputDecoration(
                labelText: title,
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  onSave(tempController.text);
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('res/images/sufismart.png'),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Text(
                      controller.user.value.username,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Obx(
              () => Column(
                children: [
                  _buildEditItem(
                    context,
                    title: 'Name',
                    value: controller.user.value.name,
                    onEdit: (val) {
                      controller.nameController.text = val;
                      controller.user.update((u) => u?.name = val);
                    },
                  ),
                  _buildEditItem(
                    context,
                    title: 'Email',
                    value: controller.user.value.email,
                    onEdit: (val) {
                      controller.emailController.text = val;
                      controller.user.update((u) => u?.email = val);
                    },
                  ),
                  _buildEditItem(
                    context,
                    title: 'Phone',
                    value: controller.user.value.phone,
                    onEdit: (val) {
                      controller.phoneController.text = val;
                      controller.user.update((u) => u?.phone = val);
                    },
                  ),
                  _buildEditItem(
                    context,
                    title: 'Address',
                    value: controller.user.value.address,
                    onEdit: (val) {
                      controller.addressController.text = val;
                      controller.user.update((u) => u?.address = val);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: controller.togglePasswordChange,
            ),
            Obx(() {
              if (!controller.isPasswordChange.value) return const SizedBox();
              return Column(
                children: [
                  _buildPasswordField(
                    'Current Password',
                    controller.currentPasswordController,
                    controller.isPasswordVisible,
                  ),
                  _buildPasswordField(
                    'New Password',
                    controller.newPasswordController,
                    controller.isPasswordVisible,
                  ),
                  _buildPasswordField(
                    'Confirm Password',
                    controller.confirmPasswordController,
                    controller.isPasswordVisible,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: controller.changePassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button,
                      foregroundColor: AppColors.bg1,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                ],
              );
            }),

            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: AppColors.bg1,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.saveProfile();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: AppColors.bg1,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditItem(
    BuildContext context, {
    required String title,
    required String value,
    required Function(String) onEdit,
  }) {
    return ListTile(
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap:
          () => _showEditDialog(
            context: context,
            title: title,
            initialValue: value,
            onSave: onEdit,
          ),
    );
  }

  Widget _buildPasswordField(
    String label,
    TextEditingController controller,
    RxBool isPasswordVisible,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Obx(
        () => TextField(
          controller: controller,
          obscureText: !isPasswordVisible.value, // Ambil dari RxBool
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: AppColors.bg1,
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: () {
                isPasswordVisible.value = !isPasswordVisible.value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
