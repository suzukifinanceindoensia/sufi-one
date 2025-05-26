import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/dashboard/controllers/mobile_collection_controller.dart';
import 'package:sufi_one/app/modules/mobcol/mobcol_routes.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/menu_creator_mobcol.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/profile_card_mobcol.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';

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
                      Get.toNamed(MobcolRoutes.mobileCollectionTugasBaru);
                    },
                    child: MenuCreatorMobcol(
                      imageUrl: "https://cdn-icons-png.freepik.com/512/7177/7177065.png",
                      number: "${controller.listTugasBaru.length}",
                      title: "Tugas Baru",
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(MobcolRoutes.mobileCollectionTugasBelumSelesai);
                    },
                    child: MenuCreatorMobcol(
                      imageUrl: "https://cdn-icons-png.flaticon.com/512/5058/5058432.png",
                      number: "${controller.listTugasBelumSelesai.length}",
                      title: "Tugas Belum\nSelesai",
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(MobcolRoutes.mobileCollectionUploadBukti);
                    },
                    child: MenuCreatorMobcol(
                      imageUrl: "https://cdn-icons-png.flaticon.com/512/762/762686.png",
                      number: "${controller.listUploadBukti.length}",
                      title: "Upload Bukti\nPembayaran",
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(MobcolRoutes.mobileCollectionTugasSelesai);
                    },
                    child: MenuCreatorMobcol(
                      imageUrl: "https://cdn-icons-png.flaticon.com/512/6783/6783643.png",
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