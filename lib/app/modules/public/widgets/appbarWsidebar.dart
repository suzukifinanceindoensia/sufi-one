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
    final authController = Get.find<AuthController>();

    return Obx(() {
      final isLoggedIn = authController.user.value != null;

      return AppBar(
        backgroundColor: AppColors.splashStart,
        centerTitle: false,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          children: [Image.asset('res/images/splashscreen2.png', height: 30)],
        ),
        leading:
            isLoggedIn
                ? IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.bg1),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                )
                : null,
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
