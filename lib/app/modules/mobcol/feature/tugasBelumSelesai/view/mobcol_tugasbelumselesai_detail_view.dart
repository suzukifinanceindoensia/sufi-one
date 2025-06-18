import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_button_style.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_container.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/profile_mobcol.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasBelumSelesai_model.dart'; // Pastikan import model ini ada

class MobcolTugasBelumSelesaiDetailView extends StatelessWidget {
  const MobcolTugasBelumSelesaiDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final TugasBelumSelesaiModel tugas = Get.arguments as TugasBelumSelesaiModel;

    return Scaffold(
      appBar: SuzukiFinanceAppBarWObutton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ProfileMobcol(
                imageroute: "res/images/mobcol/blankprofile.jpg",
                name: tugas.name ?? '', // Gunakan properti model
                username: tugas.email ?? '', // Gunakan properti model
                profession: '',
                borders: 10,
              ),
              const SizedBox(height: 20),
              MobcolContainer(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Aksi ketika GestureDetector 1 ditekan
                              print('GestureDetector 1 tapped');
                            },
                            child: Column(
                              children: [
                                Center(child: Icon(Icons.edit_note_outlined, size: 35, color: Colors.indigo.shade900)),
                                Center(child: Text('Edit Data', style: AppTextStyles.Navybodymed, textAlign: TextAlign.center,)),
                              ]
                            ),
                          ),
                        ),
                        const VerticalDivider(),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Aksi ketika GestureDetector 2 ditekan
                              print('GestureDetector 2 tapped');
                            },
                            child: Column(
                              children: [
                                Center(child: Icon(Icons.print, size: 35, color: Colors.indigo.shade900)),
                                Center(child: Text('Print Struk', style: AppTextStyles.Navybodymed, textAlign: TextAlign.center)),
                              ]
                            ),
                          ),
                        ),
                        const VerticalDivider(),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Aksi ketika GestureDetector 3 ditekan
                              print('GestureDetector 3 tapped');
                            },
                            child: Column(
                              children: [
                                Center(child: Icon(Icons.mark_email_read_rounded, size: 35, color: Colors.indigo.shade900)),
                                Center(child: Text('Send Email', style: AppTextStyles.Navybodymed, textAlign: TextAlign.center)),
                              ]
                            ),
                          ),
                        ),
                        const VerticalDivider(),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Aksi ketika GestureDetector 4 ditekan
                              print('GestureDetector 4 tapped');
                            },
                            child: Column(
                              children: [
                                Center(child: Icon(Icons.save, size: 35, color: Colors.indigo.shade900)),
                                Center(child: Text('Save Struk', style: AppTextStyles.Navybodymed, textAlign: TextAlign.center)),
                              ]
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MobcolContainer(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tipe Follow Up", style: AppTextStyles.Navybodymed),
                    Text("Berkunjung", style: AppTextStyles.bigBody),
                    const Divider(),
                    Text("Apakah bertemu dengan customer", style: AppTextStyles.Navybodymed),
                    Text("Customer", style: AppTextStyles.bigBody),
                    const Divider(),
                    Text("Nama Contact Person", style: AppTextStyles.Navybodymed),
                    Text("${tugas.name}", style: AppTextStyles.bigBody),
                    const Divider(),
                    Text("Hubungan Dengan Customer", style: AppTextStyles.Navybodymed),
                    Text("Customer", style: AppTextStyles.bigBody),
                    const Divider(),
                    Text("Alamat yang dikunjungi", style: AppTextStyles.Navybodymed),
                    Text("Alamat tagih", style: AppTextStyles.bigBody),
                    const Divider(),
                    Text("Apakah Debitur ada", style: AppTextStyles.Navybodymed),
                    Text("Ada", style: AppTextStyles.bigBody),
                    const Divider(),
                    Text("Apakah Unit ada", style: AppTextStyles.Navybodymed),
                    Text("Ada", style: AppTextStyles.bigBody),
                  ],
                ),
              ]),
              const SizedBox(height: 20),
              ElevatedButton(
                style: MobcolAppButtonStyle.goodButtonStyle(),
                onPressed: (){
                  Get.back();
                  //Get.toNamed(MobcolRoutes.mobileCollectionTugasBelumSelesai, arguments: tugas);
                },
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Text("TUGAS SELESAI", style: AppTextStyles.buttonFont, textAlign: TextAlign.center,),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}