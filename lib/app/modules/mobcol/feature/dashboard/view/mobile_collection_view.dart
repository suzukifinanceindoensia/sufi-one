import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/dashboard/controllers/mobile_collection_controller.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBelumSelesai/controller/mobcol_tugasbelumselesai_controller.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasSelesai/controller/mobcol_tugasselesai_controller.dart';
import 'package:sufi_one/app/modules/mobcol/feature/uploadBukti/controller/mobcol_uploadbukti_view.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/menu_creator_mobcol.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/profile_card_mobcol.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/routes/app_routes.dart';

class MobcolDashboardView extends StatelessWidget {
  const MobcolDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final MobcolDashboardController controller = Get.find<MobcolDashboardController>();
    return Scaffold(
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: Drawer(
        child: AppSidebar(),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ProfileCardMobcol(
              image: "https://i.pinimg.com/originals/91/20/d2/9120d2a990a4a0fe4afbe6241376cbae.jpg",
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
                      Get.toNamed(AppRoutes.mobileCollectionTugasBaru);
                    },
                    child: MenuCreatorMobcol(
                      imageUrl: "https://i.pinimg.com/originals/91/20/d2/9120d2a990a4a0fe4afbe6241376cbae.jpg",
                      number: "${controller.listTugasBaru.length}",
                      title: "Tugas Baru",
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.mobileCollectionTugasBelumSelesai);
                    },
                    child: MenuCreatorMobcol(
                      imageUrl: "https://i.pinimg.com/originals/91/20/d2/9120d2a990a4a0fe4afbe6241376cbae.jpg",
                      number: "${controller.listTugasBelumSelesai.length}",
                      title: "Tugas Belum\nSelesai",
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.mobileCollectionUploadBukti);
                    },
                    child: MenuCreatorMobcol(
                      imageUrl: "https://i.pinimg.com/originals/91/20/d2/9120d2a990a4a0fe4afbe6241376cbae.jpg",
                      number: "${controller.listUploadBukti.length}",
                      title: "Upload Bukti\nPembayaran",
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.mobileCollectionTugasSelesai);
                    },
                    child: MenuCreatorMobcol(
                      imageUrl: "https://i.pinimg.com/originals/91/20/d2/9120d2a990a4a0fe4afbe6241376cbae.jpg",
                      number: "${controller.listTugasSelesai.length}",
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