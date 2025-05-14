import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

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
          // Judul
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text("Suzuki Finance",style: AppTextStyles.appBar),
          //     Text( 'Kredit Resmi Suzuki',style: AppTextStyles.appBarSmall,),
          //   ],
          // ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
