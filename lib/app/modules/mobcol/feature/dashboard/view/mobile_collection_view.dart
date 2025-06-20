import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/dashboard/controllers/mobile_collection_controller.dart';
import 'package:sufi_one/app/modules/mobcol/mobcol_routes.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/menu_creator_mobcol.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/profile_card_mobcol.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWbackbutton.dart';

class MobcolDashboardView extends StatelessWidget {
  const MobcolDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final MobcolDashboardController controller = Get.find<MobcolDashboardController>();
    return Scaffold(
      appBar: SuzukiFinanceAppBarWbackbutton(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ProfileCardMobcol(
              image: "res/images/mobcol/blankprofile.jpg",
              name: "JON SUZUKI",
              username: "@jon.suzuki",
              profession: "Profesional Surveyor",
              borders: 0,
            ),
          ),
          Positioned.fill(
            top: 170,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(MobcolRoutes.mobileCollectionTugasBaru);
                    },
                    child: MenuCreatorMobcol(
                      imageAddress: "res/images/mobcol/tugasbaru.png",
                      number: controller.countTugasBaru,
                      title: "Tugas Baru",
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(MobcolRoutes.mobileCollectionTugasBelumSelesai);
                    },
                    child: MenuCreatorMobcol(
                      imageAddress: "res/images/mobcol/tugasbelumselesai.png",
                      number: controller.countTugasBelumSelesai,
                      title: "Tugas Belum\nSelesai",
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(MobcolRoutes.mobileCollectionUploadBukti);
                    },
                    child: MenuCreatorMobcol(
                      imageAddress: "res/images/mobcol/uploadbukti.png",
                      number: controller.countUploadBukti,
                      title: "Upload Bukti\nPembayaran",
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(MobcolRoutes.mobileCollectionTugasSelesai);
                    },
                    child: MenuCreatorMobcol(
                      imageAddress: "res/images/mobcol/tugasselesai.png",
                      number: controller.countTugasSelesai,
                      title: "Tugas Selesai",
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}