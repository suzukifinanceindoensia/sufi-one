import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/controllers/produk_controller.dart';
import 'package:sufi_one/app/routes/app_routes.dart';

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
        appBar: SuzukiFinanceAppBarWObutton(),
        body: const Center(child: Text('Produk tidak ditemukan')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: AppBar(
        title: Text(tipeDetail['name']),
        centerTitle: true,
        backgroundColor: AppColors.splashEnd,
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
                const Expanded(
                  child: Text(
                    'Silahkan kunjungi https://www.sfi.co.id untuk detail lebih lanjut.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.simulasiKredit);
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
