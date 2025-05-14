import 'package:flutter/material.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:get/get.dart';

class SuzukiFinanceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SuzukiFinanceAppBar({super.key, this.title = const Text('Register')});

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
          // Dropdown menu
          PopupMenuButton<String>(
            icon: Icon(Icons.menu, color: Colors.white),
            onSelected: (value) {
              switch (value) {
                case 'Mobile Collection':
                  Get.toNamed(AppRoutes.mobileCollection);
                  break;
                case 'Mobile Survey':
                  Get.toNamed(AppRoutes.survey);
                  break;
                case 'Zeus':
                  Get.toNamed(AppRoutes.zeus);
                  break;
                // routing lain jika sudah tersedia
                default:
                  Get.snackbar(
                    'Info',
                    'Fitur "$value" belum tersedia',
                    backgroundColor: Colors.orange.shade200,
                    snackPosition: SnackPosition.BOTTOM,
                  );
              }
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem(value: 'Zeus', child: Text('Zeus')),
                  PopupMenuItem(
                    value: 'Mobile Collection',
                    child: Text('Mobile Collection'),
                  ),
                  PopupMenuItem(
                    value: 'Mobile Survey',
                    child: Text('Mobile Survey'),
                  ),
                  PopupMenuItem(
                    value: 'Mobile Smile',
                    child: Text('Mobile Smile'),
                  ),
                  PopupMenuItem(
                    value: 'SDMS',
                    child: Text('Suzuki Dealer Management System'),
                  ),
                  PopupMenuItem(
                    value: 'SLIK',
                    child: Text('Sistem Layanan Informasi Keuangan'),
                  ),
                  PopupMenuItem(
                    value: 'BAPK',
                    child: Text('Berita Acara Penerimaan Kas'),
                  ),
                  PopupMenuItem(value: 'Promo', child: Text('Promo')),
                  PopupMenuItem(value: 'Berita', child: Text('Berita')),
                  PopupMenuItem(value: 'Fasilitas', child: Text('Fasilitas')),
                  PopupMenuItem(value: 'Cabang', child: Text('Cabang')),
                  PopupMenuItem(value: 'Kontak', child: Text('Kontak')),
                  PopupMenuItem(
                    value: 'Tentang Suzuki',
                    child: Text('Tentang Suzuki'),
                  ),
                ],
          ),
          SizedBox(width: 12),

          // Logo Suzuki
          Image.asset(
            'res/images/splashscreen2.png', // Ganti dengan logo Suzuki kamu
            height: 35,
          ),
          // SizedBox(width: 12),

          // // Judul
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text("Suzuki Finance", style: AppTextStyles.appBar),
          //     Text('Kredit Resmi Suzuki', style: AppTextStyles.appBarSmall),
          //   ],
          // ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
