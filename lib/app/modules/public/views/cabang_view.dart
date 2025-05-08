import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cabang_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class CabangView extends StatelessWidget {
  final CabangController controller = Get.put(CabangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => DropdownButtonFormField<String>(
                isExpanded: true,
                value:
                    controller.selectedCabang.value.isEmpty
                        ? null
                        : controller.selectedCabang.value,
                hint: Text(
                  'Pilih Cabang',
                  style: TextStyle(color: AppColors.iconDefault),
                ),
                items:
                    controller.cabangList.map((cabang) {
                      return DropdownMenuItem<String>(
                        value: cabang['name'],
                        child: Text(
                          cabang['name']!,
                          style: TextStyle(color: AppColors.iconDefault),
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.updateSelectedCabang(value);
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (controller.selectedCabang.value.isEmpty) {
                return SizedBox();
              }
              final selectedCabang = controller.cabangList.firstWhere(
                (cabang) => cabang['name'] == controller.selectedCabang.value,
                orElse:
                    () => {
                      'address': 'Pilih cabang untuk melihat alamat',
                      'distance': '0 km',
                    },
              );
              return Card(
                color: AppColors.bg1,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedCabang['name'] ?? 'Cabang Tidak Ditemukan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.iconDefault,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        selectedCabang['address']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.iconDefault,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedCabang['distance'] ?? '0 km',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.iconDefault,
                            ),
                          ),
                          GestureDetector(
                            onTap:
                                () =>
                                    controller.goToMap(selectedCabang['name']!),
                            child: Row(
                              children: [
                                Text(
                                  'Lihat Lokasi',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.iconDefault,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.splashEnd,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
