import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sufi_one/app/modules/public/profile_page/controllers/profile_page_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/widgets/bottomnavbar.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class TransaksiPointView extends GetView<ProfilePageController> {
  const TransaksiPointView({super.key});

  List<Map<String, dynamic>> get pointHistory => [
    {
      "point": 5000,
      "tanggal": "05 Mei 2025, 16:47",
      "deskripsi": "Anda mendapatkan point setelah register Sufi Smart",
    },
    {
      "point": 3000,
      "tanggal": "10 Mei 2025, 14:12",
      "deskripsi": "Point reward setelah menyelesaikan survey pengguna",
    },
    {
      "point": 7500,
      "tanggal": "20 Mei 2025, 09:33",
      "deskripsi": "Point bonus dari program loyalitas bulanan",
    },
    {
      "point": 2000,
      "tanggal": "02 Juni 2025, 11:05",
      "deskripsi": "Point dari mengundang teman berhasil bergabung",
    },
  ];

  String get totalPoint {
    final total = pointHistory.fold<int>(
      0,
      (sum, item) => sum + (item['point'] as int),
    );
    return NumberFormat.decimalPattern('id').format(total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SuzukiFinanceAppBarWObutton(),
      //  bottomNavigationBar: BottomNavbar(selectedIndex: 3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Riwayat Point",
                style: AppTextStyles.bigBody.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Total: $totalPoint",
                style: AppTextStyles.medBody.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.iconDefault,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: pointHistory.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = pointHistory[index];
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green.shade600,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  NumberFormat.decimalPattern(
                                    'id',
                                  ).format(item['point']),
                                  style: AppTextStyles.smallBody.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade700,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item["tanggal"],
                                  style: AppTextStyles.smallBody.copyWith(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item["deskripsi"],
                                  style: AppTextStyles.medBody.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
