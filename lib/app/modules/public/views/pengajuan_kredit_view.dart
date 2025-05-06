import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/pengajuan_kredit_controller.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';

class PengajuanKreditView extends GetView<PengajuanKreditController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pengajuan Kredit',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Silahkan isi untuk pengajuan kredit dengan menggunakan form di bawah ini',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 24), // Spasi sebelum form
              Obx(
                () => DropdownButtonFormField<String>(
                  dropdownColor: AppColors.bg1,
                  decoration: const InputDecoration(
                    labelText: 'Tipe Pembiayaan',
                  ),
                  value:
                      controller.tipePembiayaan.value.isEmpty
                          ? null
                          : controller.tipePembiayaan.value,
                  items:
                      controller.tipePembiayaanList
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                  onChanged:
                      (value) => controller.tipePembiayaan.value = value ?? '',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.namaLengkap,
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
              ),
              TextField(
                controller: controller.noKtp,
                decoration: const InputDecoration(labelText: 'No. KTP'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: controller.alamat,
                decoration: const InputDecoration(labelText: 'Alamat'),
              ),
              Obx(
                () => DropdownButtonFormField<String>(
                  dropdownColor: AppColors.bg1,
                  decoration: const InputDecoration(labelText: 'Provinsi'),
                  value:
                      controller.provinsi.value.isEmpty
                          ? null
                          : controller.provinsi.value,
                  items:
                      controller.provinsiList
                          .map(
                            (prov) => DropdownMenuItem(
                              value: prov,
                              child: Text(prov),
                            ),
                          )
                          .toList(),
                  onChanged: (value) => controller.provinsi.value = value ?? '',
                ),
              ),
              TextField(
                controller: controller.noHp,
                decoration: const InputDecoration(labelText: 'No. HP'),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: controller.email,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: controller.referral1,
                decoration: const InputDecoration(
                  labelText: 'Referral ID / IS (jika ada)',
                ),
              ),
              TextField(
                controller: controller.referral2,
                decoration: const InputDecoration(
                  labelText: 'Referral ID / IS (jika ada)',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Icon(Icons.check_circle_outline, color: AppColors.snack),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Data yang di isi adalah benar dan memenuhi persyaratan kredit yang berlaku',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.navIcon,
                    foregroundColor: AppColors.bg1,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Submit', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
