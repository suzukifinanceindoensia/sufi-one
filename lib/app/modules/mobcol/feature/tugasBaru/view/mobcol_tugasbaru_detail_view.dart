import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/controller/mobcol_tugasbaru_controller.dart';
import 'package:sufi_one/app/modules/mobcol/mobcol_routes.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_button_style.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_container.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/profile_mobcol.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasBaru_model.dart';

class MobcolTugasbaruDetailView extends StatelessWidget {
  const MobcolTugasbaruDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final AllTugasBaruModel tugas = Get.arguments as AllTugasBaruModel; // Cast arguments
    final MobcolTugasbaruController controller = Get.find();

    return Scaffold(
      appBar: SuzukiFinanceAppBarWObutton(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileMobcol(
                image: "https://i.pinimg.com/originals/91/20/d2/9120d2a990a4a0fe4afbe6241376cbae.jpg",
                name: tugas.name ?? '', // Akses properti model
                username: tugas.email ?? '', // Akses properti model
                profession: "Id : ${tugas.id ?? ''}", // Akses properti model
                borders: 10,
              ),
              const SizedBox(height: 20),
              MobcolContainer(
                children: [
                  Text('CUSTOMER INFORMATION', style: AppTextStyles.medBody),
                  const SizedBox(height: 15),
                  Text('Tanggal Go Live', style: AppTextStyles.Navybodymed),
                  Text(
                    '${tugas.dateTime?.day} ${controller.monthsInYear[tugas.dateTime?.month]}, ${tugas.dateTime?.year}', // Akses properti model
                    style: AppTextStyles.bigBody,
                  ),
                  const Divider(),
                  Text("Alamat Tagih", style: AppTextStyles.Navybodymed),
                  Text(tugas.alamatLengkap ?? '', style: AppTextStyles.bigBody), // Akses properti model
                  const Divider(),
                  Text("Nomor Telepon", style: AppTextStyles.Navybodymed,),
                  Text(tugas.phoneNumber ?? '', style: AppTextStyles.bigBody), // Akses properti model
                  const Divider(),
                  Text("Tipe Unit", style: AppTextStyles.Navybodymed),
                  Text(tugas.typeUnit ?? '', style: AppTextStyles.bigBody), // Akses properti model
                  const Divider(),
                  Text("Warna Mobil", style: AppTextStyles.Navybodymed),
                  Text(tugas.colorOfCar ?? '', style: AppTextStyles.bigBody), // Akses properti model
                  const Divider(),
                  Text("Nomor Polisi", style: AppTextStyles.Navybodymed),
                  Text(tugas.policeNumber ?? '', style: AppTextStyles.bigBody), // Akses properti model
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: MobcolAppButtonStyle.goodButtonStyle(),
                    onPressed: (){
                      Get.offAndToNamed(MobcolRoutes.mobileCollectionTugasBaru);
                      Get.toNamed(MobcolRoutes.mobileCollectionDetailCust, arguments: tugas);
                    },
                    child: FractionallySizedBox(widthFactor: 1,child: Text("View Customer Detail", style: AppTextStyles.buttonFont, textAlign: TextAlign.center,),),
                  ),
                  ElevatedButton(
                    style: MobcolAppButtonStyle.evilButtonStyle(),
                    onPressed: (){},
                    child: FractionallySizedBox(widthFactor: 1,child: Text("Update Email Customer", style: AppTextStyles.buttonFont, textAlign: TextAlign.center,),),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MobcolContainer(
                children: [
                  Text('BILLING DETAIL', style: AppTextStyles.medBody),
                  const SizedBox(height: 15),
                  Text('Tanggal Jatuh Tempo', style: AppTextStyles.Navybodymed),
                  Text(
                    '${tugas.dateTime?.day} ${controller.monthsInYear[tugas.dateTime?.month]}, ${tugas.dateTime?.year}', // Akses properti model
                    style: AppTextStyles.bigBody,
                  ),
                  const Divider(),
                  Text('Angsuran Ke', style: AppTextStyles.Navybodymed),
                  Text('${tugas.angsuranKe ?? ''}',style: AppTextStyles.bigBody,), // Akses properti model
                  const Divider(),
                  Text('Jumlah Angsuran', style: AppTextStyles.Navybodymed),
                  Text('Rp. ${tugas.money ?? ''}',style: AppTextStyles.bigBody,), // Akses properti model
                  const Divider(),
                  Text('Keterlambatan', style: AppTextStyles.Navybodymed),
                  Text('0 Hari', style: AppTextStyles.bigBody),
                  const Divider(),
                  Text('Denda Keterlambatan', style: AppTextStyles.Navybodymed),
                  Text('Rp. ${tugas.money ?? ''}',style: AppTextStyles.bigBody,), // Akses properti model
                ],
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: MobcolAppButtonStyle.goodButtonStyle(),
                onPressed: (){
                  Get.offAndToNamed(MobcolRoutes.mobileCollectionTugasBaru);
                  Get.toNamed(MobcolRoutes.mobileCollectionKunjungan, arguments: tugas);
                },
                child: FractionallySizedBox(widthFactor: 1,child: Text("START", style: AppTextStyles.buttonFont, textAlign: TextAlign.center,),),
              )
            ],
          ),
        ),
      ),
    );
  }
}