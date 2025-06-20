import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart'; 
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/controller/ceknopol_controller.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class CeknopolView extends GetView<CeknopolController> {
  const CeknopolView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nopolController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // --- Decorated Text Form and Button Side-by-Side ---
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12), // Rounded corners for the container
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 4), // subtle shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5), // Inner padding
              child: Row(
                children: [
                  Expanded(
                    // TextField takes available space
                    child: TextField(
                      controller: nopolController,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Plat Nomor',
                        hintText: 'Misal: B 1234 ABC',
                        prefixIcon: Icon(Icons.directions_car, color: Colors.black54), // Added icon
                        border: InputBorder.none, // Remove default border as container has one
                        contentPadding: const EdgeInsets.symmetric(vertical: 15), // Adjust padding
                        floatingLabelBehavior: FloatingLabelBehavior.auto, // Label floats above
                      ),
                      style: AppTextStyles.bigBody, // Apply your font style
                      textCapitalization: TextCapitalization.characters, // Capitalize input for plate numbers
                    ),
                  ),
                  const SizedBox(width: 10), // Space between text field and button
                  // --- Search Button ---
                  SizedBox(
                    height: 50, // Match height of text field visually
                    child: ElevatedButton(
                      onPressed: () {
                        controller.compareAndSetPlat(inputPlat: nopolController.text.trim()); // Trim whitespace
                      },
                      style: AppButtonStyle.primaryButtonStyle().copyWith(
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20)), // Adjust button padding
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), // Rounded corners for button
                      ),
                      child: Text(
                        'Cek', // Shorter text for button
                        style: AppTextStyles.buttonFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30), // Space between input section and results

            // --- This section Reactively Returns (Displays) the result ---
            Obx(() {
              // Show loading indicator while fetching data
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              // Show error message if data fetching failed
              if (controller.errorMessage.value.isNotEmpty) {
                return Center(
                  child: Text(
                    'Error: ${controller.errorMessage.value}',
                    style: AppTextStyles.bigBody.copyWith(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              // Display fetched data if a plat number is found
              if (controller.selectedPlatNomorList.isNotEmpty) {
                final foundData = controller.selectedPlatNomorList.first;
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Detail Plat Nomor:', style: AppTextStyles.bigBody.copyWith(fontWeight: FontWeight.bold, color: AppColors.bg3)),
                      const Divider(height: 20, thickness: 1, color: Colors.black54),
                      _buildInfoRow('Plat Nomor', foundData.platNomor),
                      _buildInfoRow('Tipe Mobil', foundData.tipeMobil),
                      _buildInfoRow('Status', foundData.status),
                      _buildInfoRow('SKMBJ', foundData.skmbj),
                      _buildInfoRow('No. SKMBJ', foundData.noSkmbj),
                    ],
                  ),
                );
              } else if (controller.SelectedPlatNomor.value == 'tidak ditemukan') {
                 return Center(
                   child: Text(
                     'Plat Nomor tidak ditemukan.',
                     style: AppTextStyles.bigBody.copyWith(color: AppColors.button2),
                   ),
                 );
              } else {
                 return Center(
                   child: Text(
                     'Masukkan plat nomor untuk mencari.',
                     style: AppTextStyles.bigBody.copyWith(color: Colors.grey),
                   ),
                 );
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text('$label:', style: AppTextStyles.bigBody.copyWith(fontWeight: FontWeight.bold, color: Colors.black54)),
          ),
          Expanded(
            child: Text(value, style: AppTextStyles.bigBody),
          ),
        ],
      ),
    );
  }
}
