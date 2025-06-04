import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/controller/detailnopol_controller.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class DetailnopolView extends GetView<DetailnopolController> {
  const DetailnopolView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: Drawer(
        child: AppSidebar(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'Plat Nomor: ${controller.SelectedPlatNomor.value}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 20),
            Obx(() => Text(
                  'Tipe Mobil: ${controller.SelectedTipeMobil.value}',
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 40),
            ElevatedButton(
              style: AppButtonStyle.primaryButtonStyle(),
              onPressed: () => controller.kembaliKeHalamanSebelumnya(),
              child: SizedBox(
                width: 170,
                child : Text("Kembali", 
                  style: AppTextStyles.buttonFont,
                  textAlign: TextAlign.center,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
