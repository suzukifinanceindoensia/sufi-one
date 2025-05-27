import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_button_style.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_container.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/profile_mobcol.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class MobcolTugasselesaiDetailView extends StatelessWidget {
  const MobcolTugasselesaiDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic tugas = Get.arguments;
    return Scaffold(
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: Drawer(
        child: AppSidebar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ProfileMobcol(
                image: "https://i.pinimg.com/236x/ea/6e/00/ea6e0069abf7777c75f59fbd2714528a.jpg", 
                name: "${tugas.name}", 
                username: "${tugas.email}", 
                profession: "${tugas.id}", 
                borders: 10),
              const SizedBox(height: 20),
                MobcolContainer(
                children: [
                  Text('CUSTOMER INFORMATION', style: AppTextStyles.medBody),
                  const SizedBox(height: 15),
                  Text('Tanggal Go Live', style: AppTextStyles.Navybodymed),
                  Text(
                    '${tugas.dateTime.day} ${tugas.dateTime.month}, ${tugas.dateTime.year}',
                    style: AppTextStyles.bigBody,
                  ),
                  const Divider(),
                  Text("Alamat Tagih", style: AppTextStyles.Navybodymed),
                  Text('${tugas.alamatLengkap}', style: AppTextStyles.bigBody),
                  const Divider(),
                  Text("Nomor Telepon", style: AppTextStyles.Navybodymed,),
                  Text('${tugas.phoneNumber}', style: AppTextStyles.bigBody),
                  const Divider(),
                  Text("Tipe Unit", style: AppTextStyles.Navybodymed),
                  Text('${tugas.typeUnit}', style: AppTextStyles.bigBody),
                  const Divider(),
                  Text("Warna Mobil", style: AppTextStyles.Navybodymed),
                  Text('${tugas.colorOfCar}', style: AppTextStyles.bigBody),
                  const Divider(),
                  Text("Nomor Polisi", style: AppTextStyles.Navybodymed),
                  Text('${tugas.phoneNumber}', style: AppTextStyles.bigBody),
                  SizedBox(height: 15),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: MobcolAppButtonStyle.goodButtonStyle(),
                onPressed: (){
                  Get.back();
                }, 
                child: FractionallySizedBox(widthFactor: 1,child: Text("Go Back", style: AppTextStyles.buttonFont, textAlign: TextAlign.center,),),
              ),
            ]
          )
        ),
      ),  
    );
  }
}