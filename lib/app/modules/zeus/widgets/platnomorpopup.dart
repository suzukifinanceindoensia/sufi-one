import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/controller/ceknopol_controller.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';

class Platnomorpopup extends StatelessWidget {
  final CeknopolController controller;

  const Platnomorpopup({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final TextEditingController platNomorController = TextEditingController();

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: const Text(
        "Pengisian Manual",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.bg3,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: platNomorController,
              decoration: InputDecoration(
                labelText: 'PLAT NOMOR',
                hintText: 'Contoh: B 1234 XYZ', // Tambahkan hint
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.directions_car_filled),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            "Batal",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text("Simpan", style: AppTextStyles.buttonFont),
          style: AppButtonStyle.primaryButtonStyle(),
          onPressed: () {
            final String plat = platNomorController.text.trim(); 
            if (plat.isNotEmpty) {
              Navigator.of(context).pop();
              controller.compareAndSetPlat(
                inputPlat: plat,
              );
            } else {
              Get.snackbar(
                'Peringatan',
                'Plat nomor tidak boleh kosong!',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.yellow[700],
                colorText: Colors.white,
              );
            }
          },
        ),
      ],
    );
  }
}