import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class MobcolDetailCustController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  final RxInt _selectedIndex = 0.obs;
  final Map<String, dynamic> tugas = Get.arguments;

  final List<String> _tabLabels = [
    'Geotagging',
    'Syarat Kredit',
    'Rumah/Usaha',
    'Obyek Pembiayaan',
    'Struktur Kredit',
    'Hasil Survey',
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: _tabLabels.length, vsync: this);
    tabController.addListener(_handleTabSelection); // Listen for tab changes
  }

  void _handleTabSelection() {
    _selectedIndex.value = tabController.index; // Update selected index
  }

  @override
  void onClose() {
    tabController.removeListener(_handleTabSelection);
    tabController.dispose();
    super.onClose();
  }

  Widget buildTabButton() {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _tabLabels.sublist(0, 3).asMap().entries.map((entry) {
              final int index = entry.key;
              final String label = entry.value;
              final bool isActive = _selectedIndex.value == index;

              return _buildTabButton(index, label, isActive);
            }).toList(),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _tabLabels.sublist(3).asMap().entries.map((entry) {
              final int index = entry.key + 3;
              final String label = entry.value;
              final bool isActive = _selectedIndex.value == index;
              return _buildTabButton(index, label, isActive);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, String label, bool isActive) {
    return GestureDetector(
      onTap: () {
        tabController.animateTo(index); // Use the class's tabController
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: GoogleFonts.outfit().fontFamily,
              fontSize: 14,
              color: isActive ? Colors.blueGrey[800] : Colors.grey, // Use isActive
            ),
          ),
          if (isActive)
            Container(
              height: 2,
              width: label.length * 8.0,
              color: AppColors.snack,
              margin: const EdgeInsets.only(top: 2),
            ),
        ],
      ),
    );
  }
}
