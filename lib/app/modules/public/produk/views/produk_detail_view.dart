import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/modules/public/produk/controllers/produk_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ProdukDetailView extends StatefulWidget {
  @override
  State<ProdukDetailView> createState() => _ProdukDetailViewState();
}

class _ProdukDetailViewState extends State<ProdukDetailView> {
  final ProdukController controller = Get.find<ProdukController>();

  @override
  Widget build(BuildContext context) {
    final tipeDetail = controller.getProdukDetail();

    if (tipeDetail == null) {
      return Scaffold(
        backgroundColor: AppColors.bg1,
        appBar: SuzukiFinanceAppBarWsidebar(),
        drawer: Drawer(child: AppSidebar()),
        body: const Center(child: Text('Produk tidak ditemukan')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: AppBar(
        title: Text(tipeDetail['name']),
        centerTitle: true,
        backgroundColor: AppColors.splashStart,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(tipeDetail['image'], height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              tipeDetail['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              tipeDetail['price'],
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final url = Uri.parse('https://www.sfi.co.id');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                    child: const Text(
                      'Silahkan kunjungi www.sfi.co.id untuk detail lebih lanjut.',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.iconDefault,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      HomeRoutes.genericWebView,
                      arguments: {
                        'title': 'Simulasi Kredit',
                        'url':
                            'https://sufismart.sfi.co.id/sufismart/api/simulasi_page_sufismart.php',
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.splashEnd,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Simulasi Kredit',
                    style: TextStyle(color: AppColors.bg1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
