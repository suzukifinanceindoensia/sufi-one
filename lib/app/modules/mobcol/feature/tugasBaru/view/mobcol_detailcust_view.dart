import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/controller/mobcol_detailcust_controller.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/foto_dan_label_mobcol.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_container.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class MobcolDetailCustView extends GetView<MobcolDetailCustController> {
  const MobcolDetailCustView({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic tugas = Get.arguments; // Ambil data dari arguments

    return Scaffold(
      appBar: SuzukiFinanceAppBarWObutton(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            controller.buildTabButton(),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                controller: controller.tabController, // Tetap gunakan controller untuk TabBar
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Geotagging Tab
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Koordinat ${tugas is Map ? tugas['coordinate'] ?? 'N/A' : 'N/A'}",
                            style: AppTextStyles.Navybodymed,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "BELUM IMPLEMENT\nMAP\n\n\nCOMING SOON",
                            style: AppTextStyles.MobcolNum,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Persyaratan Kredit Tab
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          MobcolImageWithLabel(
                              acuracy: 10,
                              heightin: 140,
                              coordinate:"${tugas is Map ? tugas['coordinate'] ?? 'N/A' : 'N/A'}",
                              text: "Foto Identitas Penjamin",
                              imageRoute:"res/images/mobcol/error.jpg"
                              ),
                          const Divider(height: 40),
                          MobcolImageWithLabel(
                              acuracy: 10,
                              heightin: 140,
                              coordinate: "${tugas is Map ? tugas['coordinate'] ?? 'N/A' : 'N/A'}",
                              text: "Foto Identitas Pemohon",
                              imageRoute:"res/images/mobcol/error.jpg"
                              ),
                          const Divider(height: 40),
                          MobcolImageWithLabel(
                              acuracy: 10,
                              heightin: 140,
                              coordinate:"${tugas is Map ? tugas['coordinate'] ?? 'N/A' : 'N/A'}",
                              text: "Foto KK Pemohon",
                              imageRoute:"res/images/mobcol/error.jpg"
                              ),
                          const Divider(height: 40),
                          MobcolImageWithLabel(
                              acuracy: 10,
                              heightin: 140,
                              coordinate:"${tugas is Map ? tugas['coordinate'] ?? 'N/A' : 'N/A'}",
                              text: "Foto KK Penjamin",
                              imageRoute:"res/images/mobcol/error.jpg"
                              ),
                          const Divider(height: 40),
                          MobcolImageWithLabel(
                              acuracy: 10,
                              heightin: 140,
                              coordinate:"${tugas is Map ? tugas['coordinate'] ?? 'N/A' : 'N/A'}",
                              text: "Foto NPWP",
                              imageRoute:"res/images/mobcol/error.jpg"
                              ),
                        ],
                      ),
                    ),
                  ),
                  // Rumah & Tempat Usaha Tab
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          MobcolImageWithLabel(
                              acuracy: 21,
                              heightin: 180,
                              coordinate:"${tugas is Map ? tugas['coordinate'] ?? 'N/A' : 'N/A'}",
                              text: "Foto Rumah 1",
                              imageRoute:"res/images/mobcol/error.jpg"
                              ),
                          const Divider(height: 40),
                          MobcolImageWithLabel(
                              acuracy: 3,
                              heightin: 180,
                              coordinate:"${tugas is Map ? tugas['coordinate'] ?? 'N/A' : 'N/A'}",
                              text: "Foto Rumah 2",
                              imageRoute:"res/images/mobcol/error.jpg"
                              ),
                          const Divider(height: 40),
                          MobcolImageWithLabel(
                              acuracy: 8,
                              heightin: 180,
                              coordinate:"${tugas is Map ? tugas['coordinate'] ?? 'N/A' : 'N/A'}",
                              text: "Foto Tempat Usaha 1",
                              imageRoute:"res/images/mobcol/error.jpg"
                              ),
                          const Divider(height: 40),
                          MobcolImageWithLabel(
                              acuracy: 11,
                              heightin: 180,
                              coordinate:"${tugas is Map ? tugas['coordinate'] ?? 'N/A' : 'N/A'}",
                              text: "Foto Tempat Usaha 2",
                              imageRoute:"res/images/mobcol/error.jpg"),
                          const Divider(height: 40),
                          MobcolImageWithLabel(
                              acuracy: 12,
                              heightin: 180,
                              coordinate:"${tugas is Map ? tugas['coordinate'] ?? 'N/A' : 'N/A'}",
                              text: "Foto Tetangga Saat Survey",
                              imageRoute:"res/images/mobcol/error.jpg"),
                        ],
                      ),
                    ),
                  ),
                  // Obyek Pembiayaan Tab
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          MobcolContainer(children: [
                            Text('BPKB Atas Nama',
                                style: AppTextStyles.Navybodymed),
                            Text(
                              '${tugas is Map ? tugas['name'] ?? 'N/A' : 'N/A'}',
                              style: AppTextStyles.bigBody,
                            ),
                            const Divider(),
                            Text(
                              "Harga OTR",
                              style: AppTextStyles.Navybodymed,
                            ),
                            Text('Uang Uang', style: AppTextStyles.bigBody),
                            const Divider(),
                            Text(
                              "Warna",
                              style: AppTextStyles.Navybodymed,
                            ),
                            Text(
                                '${tugas is Map ? tugas['colorOfCar'] ?? 'N/A' : 'N/A'}',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text(
                              "Jenis Objek Pembiayaan",
                              style: AppTextStyles.Navybodymed,
                            ),
                            Text('Jenisnya', style: AppTextStyles.bigBody),
                            const Divider(),
                            Text(
                              "Merk Objek Pembiayaan",
                              style: AppTextStyles.Navybodymed,
                            ),
                            Text('Merk Mobil', style: AppTextStyles.bigBody),
                            const Divider(),
                            Text("Kondisi", style: AppTextStyles.Navybodymed),
                            Text(
                                '${tugas is Map ? tugas['kondisi'] ?? 'N/A' : 'N/A'}',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text('Model Objek Pembiayaan',
                                style: AppTextStyles.Navybodymed),
                            Text(
                                '${tugas is Map ? tugas['typeUnit'] ?? 'N/A' : 'N/A'}',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text('Tipe Objek Pembiayaan',
                                style: AppTextStyles.Navybodymed),
                            Text(
                                '${tugas is Map ? tugas['typeUnit'] ?? 'N/A' : 'N/A'}',
                                style: AppTextStyles.bigBody),
                            const SizedBox(height: 15),
                          ])
                        ],
                      ),
                    ),
                  ),
                  // Struktur Kredit
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          MobcolContainer(children: [
                            Text('BPKB Atas Nama',
                                style: AppTextStyles.Navybodymed),
                            Text(
                              '${tugas is Map ? tugas['name'] ?? 'N/A' : 'N/A'}',
                              style: AppTextStyles.bigBody,
                            ),
                            const Divider(),
                            Text(
                              "Harga OTR",
                              style: AppTextStyles.Navybodymed,
                            ),
                            Text('Uang Uang', style: AppTextStyles.bigBody),
                            const Divider(),
                            Text(
                              "Warna",
                              style: AppTextStyles.Navybodymed,
                            ),
                            Text(
                                '${tugas is Map ? tugas['colorOfCar'] ?? 'N/A' : 'N/A'}',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text(
                              "Jenis Objek Pembiayaan",
                              style: AppTextStyles.Navybodymed,
                            ),
                            Text('Jenisnya', style: AppTextStyles.bigBody),
                            const Divider(),
                            Text(
                              "Merk Objek Pembiayaan",
                              style: AppTextStyles.Navybodymed,
                            ),
                            Text('Merk Mobil', style: AppTextStyles.bigBody),
                            const Divider(),
                            Text("Kondisi", style: AppTextStyles.Navybodymed),
                            Text(
                                '${tugas is Map ? tugas['kondisi'] ?? 'N/A' : 'N/A'}',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text('Model Objek Pembiayaan',
                                style: AppTextStyles.Navybodymed),
                            Text(
                                '${tugas is Map ? tugas['typeUnit'] ?? 'N/A' : 'N/A'}',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text('Tipe Objek Pembiayaan',
                                style: AppTextStyles.Navybodymed),
                            Text(
                                '${tugas is Map ? tugas['typeUnit'] ?? 'N/A' : 'N/A'}',
                                style: AppTextStyles.bigBody),
                            const SizedBox(height: 15),
                          ])
                        ],
                      ),
                    ),
                  ),
                  // Hasil Survey Tab
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          MobcolContainer(children: [
                            Text('Pertanyaan Survey 1',
                                style: AppTextStyles.Navybodymed),
                            Text(
                              'Jawaban Survey 1',
                              style: AppTextStyles.bigBody,
                            ),
                            const Divider(),
                            Text("Pertanyaan Survey 2",
                                style: AppTextStyles.Navybodymed),
                            Text('Jawaban Survey 2',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text(
                              "Pertanyaan Survey 3",
                              style: AppTextStyles.Navybodymed,
                            ),
                            Text('Jawaban Survey 3',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text("Pertanyaan Survey 4",
                                style: AppTextStyles.Navybodymed),
                            Text('Jawaban Survey 4',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text("Pertanyaan Survey 5",
                                style: AppTextStyles.Navybodymed),
                            Text('Jawaban Survey 5',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text("Pertanyaan Survey 6",
                                style: AppTextStyles.Navybodymed),
                            Text('Jawaban Survey 6',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text("Pertanyaan Survey 7",
                                style: AppTextStyles.Navybodymed),
                            Text('Jawaban Survey 7',
                                style: AppTextStyles.bigBody),
                            const Divider(),
                            Text("Pertanyaan Survey 8",
                                style: AppTextStyles.Navybodymed),
                            Text('Jawaban Survey 8',
                                style: AppTextStyles.bigBody),
                            const SizedBox(height: 15),
                          ])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}