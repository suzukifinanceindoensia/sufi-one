import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/profile_page/controllers/profile_page_controller.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/bottomnavbar.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/auth/controllers/auth_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: const SuzukiFinanceAppBarWsidebar(),
      drawer: const Drawer(child: AppSidebar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildHeader(),
            const SizedBox(height: 16),
            _buildMenuSection(),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(selectedIndex: 3),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blueGrey,
          child: Icon(Icons.person, size: 48, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Obx(() {
          final user = controller.user.value;
          return Text(user?.name ?? 'No Name', style: AppTextStyles.bigBody);
        }),
        Obx(() {
          final user = controller.user.value;
          return Text(
            user?.email ?? 'No Email',
            style: AppTextStyles.smallBody,
          );
        }),
        Obx(() {
          final user = controller.user.value;
          // Kalau user.role kosong/null tampilkan "No Role"
          return Text(
            user?.role ?? 'No Role',
            style: AppTextStyles.smallBody.copyWith(
              fontStyle: FontStyle.italic,
              color: Colors.grey[600],
            ),
          );
        }),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.bg1,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: AppColors.iconDefault,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoTile('Points', '5.000', Icons.monetization_on),
              Container(height: 32, width: 1, color: AppColors.bg1),
              _buildInfoTile('Sobat Sufi', 'DF9A549', Icons.card_membership),
              Container(height: 32, width: 1, color: AppColors.bg1),
              _buildInfoTile('Level', 'Silver', Icons.military_tech),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile(String label, String value, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.orange, size: 18),
            const SizedBox(width: 4),
            Text(
              value,
              style: AppTextStyles.medBody.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(label, style: AppTextStyles.smallBody),
      ],
    );
  }

  Widget _buildMenuSection() {
    return Column(
      children: [
        _buildMenuItem('Pengajuan kendaraan saya', Icons.directions_car, () {
          // TODO: Implementasi navigasi jika ada
        }),
        _buildMenuItem('Riwayat Transaksi Point', Icons.history, () {
          Get.toNamed(HomeRoutes.transaksiPoint);
        }),
        _buildMenuItem('Ubah Profil', Icons.person, () {
          Get.toNamed(HomeRoutes.profileEdit);
        }),
        _buildMenuItem('Atur Ulang Kata Sandi', Icons.lock_reset, () {
          Get.toNamed(HomeRoutes.ubahPassword);
        }),
        _buildMenuItem('Keluar', Icons.logout, () {
          final AuthController authController = Get.find<AuthController>();
          authController.logout();
          Get.offAllNamed(HomeRoutes.login);
        }),
      ],
    );
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: AppTextStyles.medBody),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
