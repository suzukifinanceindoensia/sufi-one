import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class SuzukiFinanceAppBarWObutton extends StatelessWidget
    implements PreferredSizeWidget {
  const SuzukiFinanceAppBarWObutton({
    super.key,
    this.title = const Text('Register'),
  });

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.splashStart,
      centerTitle: false,
      toolbarHeight: 50,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // Logo Suzuki
          Image.asset(
            'res/images/splashscreen2.png', // Ganti dengan logo Suzuki kamu
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
