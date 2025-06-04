import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/controller/detailnopol_controller.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class DetailnopolView extends GetView<DetailnopolController> {
  const DetailnopolView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWObutton(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (controller.SelectedPlatNomor.value == 'Tidak Ditemukan') {
                return Text("TIDAK ADA DATA");
              } else {
                if (controller.SelectedSKMBJ.value =='true') {
                  return Column(
                    children: [
                      Text(
                        'Plat Nomor: ${controller.SelectedPlatNomor.value}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Tipe Mobil: ${controller.SelectedTipeMobil.value}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Status: ${controller.SelectedStatus.value}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Nomor SKMBJ: ${controller.SelectedNo_SKMBJ.value}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  );
                } else {
                  return Text("INI FALSE");
                }
              }
            }),

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
