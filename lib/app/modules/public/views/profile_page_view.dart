import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/public/widgets/appbar.dart';
import 'package:sufi_one/app/modules/public/widgets/bottomnavbar.dart';
import 'package:sufi_one/app/modules/public/controllers/profile_page_controller.dart';
import 'package:sufi_one/app/routes/app_routes.dart';

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
            Container(
              color: AppColors.bg1,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: const AssetImage(
                      'res/images/sufismart.png',
                    ),
                    backgroundColor: AppColors.bg2,
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Text(
                      'Hello, ${controller.user.value.username}',
                      style: AppTextStyles.medBody.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Role', style: AppTextStyles.smallBody),
                              Obx(
                                () => Text(
                                  controller.user.value.role,
                                  style: AppTextStyles.smallBody,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Container(
                        height: 24,
                        child: const VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                          width: 32,
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Cabang', style: AppTextStyles.smallBody),
                              Obx(
                                () => Text(
                                  controller.user.value.cabang,
                                  style: AppTextStyles.smallBody,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
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
                  Text('Account', style: AppTextStyles.smallBody),
                  const SizedBox(height: 8),
                  _buildProfileMenuItem(
                    'Edit Profile',
                    Icons.arrow_forward_ios,
                  ),
                  _buildProfileMenuItem(
                    'Pesanan Saya',
                    Icons.arrow_forward_ios,
                  ),
                  _buildProfileMenuItem('Bantuan', Icons.arrow_forward_ios),
                  const Divider(),
                  Text('General', style: AppTextStyles.smallBody),
                  const SizedBox(height: 8),
                  _buildProfileMenuItem(
                    'Privacy & Policy',
                    Icons.arrow_forward_ios,
                  ),
                  _buildProfileMenuItem(
                    'Term of Service',
                    Icons.arrow_forward_ios,
                  ),
                  _buildProfileMenuItem('Rate App', Icons.arrow_forward_ios),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(selectedIndex: 3),
    );
  }

  Widget _buildProfileMenuItem(String title, IconData icon) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: AppTextStyles.medBody),
      trailing: Icon(icon, size: 16, color: Colors.grey),
      onTap: () {
        // Menavigasi ke halaman edit profil
        if (title == 'Edit Profile') {
          Get.toNamed(AppRoutes.profileEdit); // Arahkan ke profileEditView
        }
      },
    );
  }
}
