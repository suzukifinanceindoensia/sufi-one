import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/cabang/controllers/cabang_controller.dart';
import 'package:sufi_one/app/modules/public/cabang/models/cabang_model.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class CabangView extends GetView<CabangController> {
  const CabangView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: Drawer(child: AppSidebar()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => DropdownButtonFormField<String>(
                dropdownColor: AppColors.bg1,
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
                        value: cabang.name,
                        child: Text(
                          cabang.name,
                          style: TextStyle(color: AppColors.iconDefault),
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.updateSelectedCabang(value);
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.bg1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.iconDefault),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (controller.selectedCabang.value.isEmpty) {
                return Text(
                  'Pilih cabang untuk melihat detail lokasi',
                  style: TextStyle(color: AppColors.iconDefault, fontSize: 14),
                );
              }

              final selectedCabang = controller.cabangList.firstWhere(
                (cabang) => cabang.name == controller.selectedCabang.value,
                orElse:
                    () => CabangModel(
                      name: 'Cabang Tidak Ditemukan',
                      address: 'Alamat tidak tersedia',
                      latitude: 0,
                      longitude: 0,
                      distance: '0 km',
                    ),
              );

              return Card(
                color: AppColors.bg1,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedCabang.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.iconDefault,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        selectedCabang.address,
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
                            selectedCabang.distance,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.iconDefault,
                            ),
                          ),
                          GestureDetector(
                            onTap:
                                () => controller.goToMap(selectedCabang.name),
                            child: Row(
                              children: [
                                Text(
                                  'Lihat Lokasi',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.splashEnd,
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
