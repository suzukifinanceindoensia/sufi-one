import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/uploadBukti/controller/mobcol_uploadbukti_detail_controller.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_button_style.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_container.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/profile_mobcol.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class MobcolUploadbuktiDetailView extends GetView<MobcolUploadbuktiDetailController> {
  const MobcolUploadbuktiDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic tugas = Get.arguments;

    return Scaffold(
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: const Drawer(
        child: AppSidebar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ProfileMobcol(
              image: "https://i.pinimg.com/originals/91/20/d2/9120d2a990a4a0fe4afbe6241376cbae.jpg",
              name: "${tugas.name}",
              username: "${tugas.email}",
              profession: "Id : ${tugas.id}",
              borders: 10,
            ),
            const SizedBox(height: 20),
            MobcolContainer(
              children: [
                Text("Upload Bukti Pembayaran", style: AppTextStyles.Navybodymed),
                const Divider(color: Colors.black54),
                Text("Nomor Bp", style: AppTextStyles.Navybodymed),
                Text("${tugas.id}", style: AppTextStyles.bigBody),
                const Divider(color: Colors.black54),
                Text("Tanggal Pembayaran", style: AppTextStyles.Navybodymed),
                Text("${tugas.dateTime.year}-${tugas.dateTime.month}-${tugas.dateTime.day}", style: AppTextStyles.bigBody),
                const Divider(color: Colors.black54),
                Text("Upload Bukti Pembayaran", style: AppTextStyles.Navybodymed),
                const SizedBox(height: 10),
                Obx(() => controller.image.value != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.file(
                            controller.image.value!,
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ],
                      )
                    : const Text("Belum ada foto yang diambil.")),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: MobcolAppButtonStyle.goodButtonStyle(),
                  onPressed: controller.getImageFromCamera,
                  child: FractionallySizedBox(widthFactor: 1, child: Text("Ambil Foto", style: AppTextStyles.buttonFont, textAlign: TextAlign.center)),
                ),
                const SizedBox(height: 10),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: MobcolAppButtonStyle.goodButtonStyle(),
              onPressed: (){
                Get.back();
              },
              child: FractionallySizedBox(widthFactor: 1,child: Text("SUBMIT", style: AppTextStyles.buttonFont,textAlign: TextAlign.center,)),
            )
          ],
        ),
      ),
    );
  }
}