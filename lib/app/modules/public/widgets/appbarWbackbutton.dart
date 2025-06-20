import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:get/get.dart'; 

class SuzukiFinanceAppBarWbackbutton extends StatelessWidget
    implements PreferredSizeWidget {
  const SuzukiFinanceAppBarWbackbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.navIcon,
      centerTitle: false,
      toolbarHeight: 50,
      automaticallyImplyLeading: false,
      leading: IconButton(
        //icon: const Icon(Icons.arrow_back_ios_new),
        icon: const Icon(Icons.arrow_back_sharp),
        color: Colors.white,
        onPressed: () {
          Get.back();
        },
      ),
      title: Row(
        children: [
          Image.asset(
            'res/images/splashscreen2.png',
            height: 35,
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}