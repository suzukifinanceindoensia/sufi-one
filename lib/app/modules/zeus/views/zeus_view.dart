import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming GetX is still used for other parts of your app
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart'; // Your custom AppBar
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart'; // Your custom Sidebar
import 'package:sufi_one/app/modules/zeus/controllers/zeus_controller.dart';
import 'package:sufi_one/app/theme/color_constant.dart'; 
import 'dart:io';

import 'package:sufi_one/app/theme/fontstyle.dart'; // Import for File class


class ZeusView extends GetView<ZeusController> {
  const ZeusView({super.key});

  void _showManualFormDialog(BuildContext context) {
    final TextEditingController _platNomorController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Sudut membulat untuk dialog
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
                  controller: _platNomorController, 
                  decoration: InputDecoration(
                    labelText: 'PLAT NOMOR',
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
              child: Text("Simpan", style: AppTextStyles.buttonFont,),
              style: AppButtonStyle.primaryButtonStyle(),
              onPressed: () {
                final String plat = _platNomorController.text;
                Navigator.of(context).pop();
                controller.printManualFormData(
                  plat: plat,
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: Drawer(
        child: AppSidebar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("INI ADALAH HALAMAN ZEUS", style: AppTextStyles.bigBody,textAlign: TextAlign.center,),
              const SizedBox(height: 20), 
              Obx(() => Container(
                height: 400, 
                width: 400, 
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(17.0), 
                  color: Colors.grey[200], 
                ),
                child: controller.imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(15.0), 
                        child: Image.file(
                          File(controller.imageFile!.path), 
                          height: 400,
                          width: 400, 
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Center(
                        child: Icon(
                          Icons.camera_alt,
                          size: 120,
                          color: Colors.grey,
                        ),
                      ),
              )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.takePhoto,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5, // Efek bayangan
                    ),
                    child: const Text(
                      "Ambil Foto",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15), 
                  ElevatedButton(
                    onPressed: () => _showManualFormDialog(context), 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white, 
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5, 
                    ),
                    child: const Text(
                      "Isi Manual",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}