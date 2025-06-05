import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/controller/ceknopol_controller.dart';
import 'package:sufi_one/app/modules/zeus/widgets/zeus_sidebar.dart';
import 'package:sufi_one/app/modules/zeus/zeus_route.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'dart:io';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/zeus/widgets/platnomorpopup.dart';


class CeknopolView extends GetView<CeknopolController> {
  const CeknopolView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: Drawer(
        child: ZeusSidebar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Text("INI ADALAH HALAMAN ZEUS", style: AppTextStyles.bigBody,textAlign: TextAlign.center,),
            const SizedBox(height: 20),
            Obx(() => Container(
                  height: MediaQuery.of(context).size.width-50,
                  width: MediaQuery.of(context).size.width-50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(17.0),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: controller.imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.file(
                            File(controller.imageFile!.path),
                            height: MediaQuery.of(context).size.width-50,
                            width: MediaQuery.of(context).size.width-50,
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
                )
            ),
            const SizedBox(height: 20),
            Obx(() => controller.photoTaken
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width-50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.6),
                          borderRadius: BorderRadius.circular(17.0),
                          color: AppColors.bg2,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Plat Nomor: ${controller.SelectedPlatNomor}",
                              style: AppTextStyles.bigBody,
                            ),
                            const Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                            Text("Tipe Mobil: ${controller.SelectedTipeMobil}",
                              style: AppTextStyles.bigBody,
                            ),
                            const Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                            Text("Status: ${controller.SelectedStatus}",
                              style: AppTextStyles.bigBody,
                            ),
                            const Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                            Text("No SKMBJ : ${controller.SelectedNo_SKMBJ}",
                              style: AppTextStyles.bigBody,
                            ),
                            const SizedBox(height: 25),
                            Center(
                              child: ElevatedButton(
                                onPressed: (){
                                  Get.toNamed(ZeusRoute.detailnopol, arguments: controller.selectedPlatNomorList);
                                },
                                style: AppButtonStyle.primaryButtonStyle(),
                                child: SizedBox(
                                  width: 170,
                                  child: Text("Detail",
                                    style: AppTextStyles.buttonFont,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: controller.takePhoto,
                  style: AppButtonStyle.primaryButtonStyle(),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width/2 - 40,
                    child: Text("Ambil Foto",
                      style: AppTextStyles.buttonFont,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Platnomorpopup(controller: controller);
                      },
                    );
                  },
                  style: AppButtonStyle.primaryButtonStyle(),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width/2 - 40,
                    child: Text("Pengisian Manual",
                      style: AppTextStyles.buttonFont,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}