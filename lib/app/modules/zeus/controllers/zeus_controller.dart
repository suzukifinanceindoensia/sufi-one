import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'dart:math';
import 'dart:ui';

class ZeusController extends GetxController {
  var imagePath = ''.obs;
  var nomorPolisi = ''.obs;
  var status = ''.obs;
  var skmbj = ''.obs;
  var isLoading = false.obs;

  var detailData =
      <String, String>{
        'No Kontrak': '1234567890',
        'No Polisi': 'B 1234 XYZ',
        'Nama STNK': 'John Doe',
        'Unit': 'Suzuki Ertiga',
        'Model': 'Ertiga GX',
        'Type': 'MPV',
        'Warna': 'Putih',
        'Cabang': 'Jakarta Barat',
        'Telp Head': '021-12345678',
      }.obs;

  Future<void> scanPlatNomor() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 1));

    final random = Random();

    final kontrakList = ['1234567890', '9876543210', '5678901234'];
    final polisiList = ['B 1234 XYZ', 'D 4567 ABC', 'F 7890 GHI'];
    final namaList = ['John Doe', 'Jane Smith', 'Agus Sutomo'];
    final unitList = ['Suzuki Ertiga', 'Suzuki XL7', 'Suzuki Carry'];
    final modelList = ['Ertiga GX', 'XL7 Hybrid', 'Carry FD'];
    final typeList = ['MPV', 'SUV', 'Pickup'];
    final warnaList = ['Putih', 'Hitam', 'Silver'];
    final cabangList = ['Jakarta Barat', 'Bandung', 'Bekasi'];
    final telpList = ['021-12345678', '022-87654321', '0251-112233'];

    int i = random.nextInt(3);

    nomorPolisi(polisiList[i]);
    status(['Aktif', 'Tidak Aktif', 'Overdue'][i]);
    skmbj('SKMBJ-2025-04${20 + i}');

    detailData.value = {
      'No Kontrak': kontrakList[i],
      'No Polisi': polisiList[i],
      'Nama STNK': namaList[i],
      'Unit': unitList[i],
      'Model': modelList[i],
      'Type': typeList[i],
      'Warna': warnaList[i],
      'Cabang': cabangList[i],
      'Telp Head': telpList[i],
    };

    imagePath('res/images/lokasi_foto.jpg');

    isLoading(false);
  }

  void shareOptions() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          color: AppColors.bg1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.iconDefault,
              blurRadius: 10,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.print),
              title: Text('Print SKMBJ', style: AppTextStyles.smallBody),
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: Text(
                'Bagikan via WhatsApp',
                style: AppTextStyles.smallBody,
              ),
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: Text('Bagikan via Gmail', style: AppTextStyles.smallBody),
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: Text(
                'Bagikan via Outlook',
                style: AppTextStyles.smallBody,
              ),
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: Text(
                'Simpan sebagai Gambar',
                style: AppTextStyles.smallBody,
              ),
              onTap: () => Get.back(),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

  void showDelayNotification() {
    final List<int> daysLateOptions = [5, 7, 10, 14, 24];
    final int randomDaysLate =
        daysLateOptions[DateTime.now().millisecondsSinceEpoch %
            daysLateOptions.length];

    Get.dialog(
      Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.bg1,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.iconDefault,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.button,
                    size: 48,
                  ),
                  const SizedBox(height: 12),
                  Text('Terlambat Bayar', style: AppTextStyles.medTitle),
                  const SizedBox(height: 8),
                  Text(
                    'Telat $randomDaysLate hari bayar angsuran.',
                    style: AppTextStyles.medTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.splashEnd,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Get.back(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: Text('OK', style: AppTextStyles.smallBodyBold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
