import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/controllers/auth_controller.dart';

class SuzukiFinanceAppBarWsidebar extends StatelessWidget
    implements PreferredSizeWidget {
  const SuzukiFinanceAppBarWsidebar({
    super.key,
    this.title = const Text('Register'),
  });

  final Widget title;

  @override
  Widget build(BuildContext context) {
    // Mengambil instance dari AuthController
    final authController = Get.find<AuthController>();

    return Obx(() {
      // verifikasi apakah user sudah login
      final isLoggedIn = authController.user.value != null;

      return AppBar(
        backgroundColor: AppColors.navIcon, // Warna latar AppBar
        centerTitle: false,
        toolbarHeight: 50, // Tinggi AppBar
        automaticallyImplyLeading:
            false, // Tidak menampilkan tombol kembali default
        title: Row(
          children: [
            // Logo pada AppBar
            Image.asset('res/images/splashscreen2.png', height: 30),
          ],
        ),
        leading:
            isLoggedIn
                // Jika user sudah login, tampilkan ikon menu untuk membuka drawer
                ? IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.bg1),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                )
                : null, // Jika belum login, tidak menampilkan ikon
      );
    });
  }

  // Menentukan ukuran tinggi AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
