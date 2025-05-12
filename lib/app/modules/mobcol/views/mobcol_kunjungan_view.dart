import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/controllers/mobcol_kunjungan_controller.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_button_style.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_container.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/profile_card_mobcol.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:intl/intl.dart';

class MobcolKunjunganView extends GetView<KunjunganController> {
  const MobcolKunjunganView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> tugas = Get.arguments;
    return Scaffold(
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: const Drawer(
        child: AppSidebar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.kunjunganKey, // Assign the key
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //INFORMASI PELANGGAN
                ProfileCardMobcol(
                  image:
                      "https://media.istockphoto.com/id/515660465/id/vektor/siluet-kepala.jpg?s=612x612&w=0&k=20&c=HepLXginpYBXHOYvPtjU_VX-fFtBtvPIzLEjlnFvq4c=",
                  name: "${tugas['name']}", 
                  username: "${tugas['email']}",
                  profession: "TARGET",
                  borders: 10,
                ),
                const SizedBox(height: 20),
                // 1. Tipe Follow Up
                MobcolContainer(children: [
                  Text(
                    'Tipe Follow Up',
                    style: AppTextStyles.Navybodymed,
                  ),
                  DropdownButtonFormField<String>(
                    value: controller.answers[0],
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        // null check
                        controller.answers[0] = newValue;
                        controller.showQuestions.value =
                            newValue == 'Berkunjung'; // Show questions if "Berkunjung"
                        controller.update();
                      }
                    },
                    items: controller.tipeFollowUpOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: AppTextStyles.Navybodymed),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Pilih tipe follow up',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon pilih tipe follow up';
                      }
                      return null;
                    },
                  ),
                ]),
                const SizedBox(height: 20),
                // Conditional rendering of the rest of the form
                if (controller.showQuestions.value)
                  MobcolContainer(children: [
                    // 2. Ambil Foto Lokasi
                    Text(
                      'Ambil Foto Lokasi',
                      style: AppTextStyles.Navybodymed,
                    ),
                    if (controller.answers[1] != null) ...[
                      const SizedBox(height: 5),
                      Center(
                        child: SizedBox(
                          height: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              controller.answers[1],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 10),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                        style: MobcolAppButtonStyle.goodButtonStyle(),
                        onPressed: () => controller.pickImage(2),
                        child: Text('Ambil Foto Lokasi',
                            style: AppTextStyles.buttonFont),
                      ),
                    ),
                  ]),
                if (controller.showQuestions.value) const SizedBox(height: 20),
                if (controller.showQuestions.value)
                  MobcolContainer(children: [
                    // 3. Bertemu Dengan Siapa
                    Text(
                      'Bertemu Dengan Siapa',
                      style: AppTextStyles.Navybodymed,
                    ),
                    DropdownButtonFormField<String>(
                      value: controller.answers[2],
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          // null check
                          controller.answers[2] = newValue;
                          controller.update();
                        }
                      },
                      items: controller.bertemuDenganSiapaOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:
                              Text(value, style: AppTextStyles.Navybodymed),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Pilih dengan siapa bertemu',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon pilih dengan siapa anda bertemu';
                        }
                        return null;
                      },
                    ),
                  ]),
                if (controller.showQuestions.value) const SizedBox(height: 20),
                if (controller.showQuestions.value)
                  // 4. Apakah Nomor Telepon Customer Berubah
                  MobcolContainer(children: [
                    Text(
                      'Apakah Nomor Telepon Customer Berubah',
                      style: AppTextStyles.Navybodymed,
                    ),
                    DropdownButtonFormField<String>(
                      value: controller.answers[3],
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          // null check
                          controller.answers[3] = newValue;
                          controller.update();
                        }
                      },
                      items: controller.yaTidakOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:
                              Text(value, style: AppTextStyles.Navybodymed),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Pilih',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon pilih jawaban';
                        }
                        return null;
                      },
                    ),
                  ]),
                if (controller.showQuestions.value) const SizedBox(height: 20),
                if (controller.showQuestions.value)
                  // 5. Apakah Alamat Customer Berubah
                  MobcolContainer(children: [
                    Text(
                      'Apakah Alamat Customer Berubah',
                      style: AppTextStyles.Navybodymed,
                    ),
                    DropdownButtonFormField<String>(
                      value: controller.answers[4],
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          // null check
                          controller.answers[4] = newValue;
                          controller.update();
                        }
                      },
                      items: controller.yaTidakOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:
                              Text(value, style: AppTextStyles.Navybodymed),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Pilih',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon pilih jawaban';
                        }
                        return null;
                      },
                    ),
                  ]),
                if (controller.showQuestions.value) const SizedBox(height: 20),
                if (controller.showQuestions.value)
                  // 6. Apakah Debitur Ada
                  MobcolContainer(children: [
                    Text(
                      'Apakah Debitur Ada',
                      style: AppTextStyles.Navybodymed,
                    ),
                    DropdownButtonFormField<String>(
                      value: controller.answers[5],
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          // null check
                          controller.answers[5] = newValue;
                          controller.update();
                        }
                      },
                      items: controller.yaTidakOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:
                              Text(value, style: AppTextStyles.Navybodymed),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Pilih',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon pilih jawaban';
                        }
                        return null;
                      },
                    ),
                  ]),
                if (controller.showQuestions.value) const SizedBox(height: 20),
                if (controller.showQuestions.value)
                  MobcolContainer(children: [
                    SizedBox(height: 10,),
                    // 7. Apakah Unit Ada
                    Text(
                      'Apakah Unit Ada',
                      style: AppTextStyles.Navybodymed,
                    ),
                    DropdownButtonFormField<String>(
                      value: controller.answers[6],
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          // null check
                          controller.answers[6] = newValue;
                          controller.update();
                        }
                      },
                      items: controller.yaTidakOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:
                              Text(value, style: AppTextStyles.Navybodymed),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Pilih',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon pilih jawaban';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    const Divider(
                      height: 20,
                      thickness: 2,
                      color: Colors.black38,
                    ),
                    // 8. Apakah Customer Akan Membayar
                    Text(
                      'Apakah Customer Akan Membayar',
                      style: AppTextStyles.Navybodymed,
                    ),
                    DropdownButtonFormField<String>(
                      value: controller.answers[7],
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          // null check
                          controller.answers[7] = newValue;
                          controller.update();
                        }
                      },
                      items: controller.yaTidakOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:
                              Text(value, style: AppTextStyles.Navybodymed),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Pilih',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon pilih jawaban';
                        }
                        return null;
                      },
                    ),
                  if (controller.showQuestions.value) const SizedBox(height: 10),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    color: Colors.black38,
                  ),
                  if (controller.showQuestions.value)
                    Text(
                      'Hasil Kunjungan',
                      style: AppTextStyles.Navybodymed,
                    ),
                    TextFormField(
                      controller: controller.hasilKunjunganController,
                      decoration: const InputDecoration(
                        labelText: 'Masukkan hasil kunjungan',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon masukkan hasil kunjungan';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      style:
                          AppTextStyles.Navybodymed, // Apply the text style
                    ),
                  ]),

                if (controller.showQuestions.value) const SizedBox(height: 20),
                if (controller.showQuestions.value)
                  // 10. Tentukan Janji Bayar
                  MobcolContainer(children: [
                    Text(
                      'Tentukan Janji Bayar',
                      style: AppTextStyles.Navybodymed,
                    ),
                    TextFormField(
                      // Use a regular TextFormField, but make it read-only and use a tap handler.
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Pilih Tanggal Janji Bayar',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      controller: TextEditingController(
                        text: controller.answers[9] != null
                            ? DateFormat('dd-MM-yyyy')
                                .format(controller.answers[9])
                            : '', // Display selected date or empty string
                      ),
                      onTap: () async {
                        // Show the date picker when the field is tapped.
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (pickedDate != null) {
                          controller.answers[9] =
                              pickedDate; // Store the selected date as a DateTime object
                          controller.update();
                        }
                      },
                      validator: (value) {
                        if (controller.answers[9] == null) {
                          return 'Mohon tentukan tanggal janji bayar';
                        }
                        return null;
                      },
                      style: AppTextStyles.Navybodymed,
                    ),
                  ]),
                if (controller.showQuestions.value) const SizedBox(height: 20),
                if (controller.showQuestions.value)
                  // 11. Apakah Ada Serah Terima Surat Peringatan ke Nasabah
                  MobcolContainer(children: [
                    Text(
                      'Apakah Ada Serah Terima Surat Peringatan ke Nasabah',
                      style: AppTextStyles.Navybodymed,
                    ),
                    DropdownButtonFormField<String>(
                      value: controller.answers[10],
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          // null check
                          controller.answers[10] = newValue;
                          controller.showSuratPeringatanQuestion.value =
                              newValue ==
                                  'Ya'; // Show question 12 if the answer is "Ya"
                          controller.update(); //update
                        }
                      },
                      items: controller.yaTidakOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:
                              Text(value, style: AppTextStyles.Navybodymed),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Pilih',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon pilih jawaban';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // 12. Ambil Foto (Surat Peringatan) - Conditional Question
                    if (controller.showSuratPeringatanQuestion.value) ...[
                      Text(
                        'Ambil Foto Surat Peringatan',
                        style: AppTextStyles.Navybodymed,
                      ),
                      if (controller.answers[11] != null) ...[
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 400,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              controller.answers[11],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 10),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                          style: MobcolAppButtonStyle.goodButtonStyle(),
                          onPressed: () => controller.pickImage(12),
                          child: Text('Ambil Foto Surat Peringatan',
                              style: AppTextStyles.buttonFont),
                        ),
                      ),
                    ],
                  ]),
                const SizedBox(height: 20),
                // Tombol Submit
                ElevatedButton(
                  style: MobcolAppButtonStyle.goodButtonStyle(),
                  onPressed: () => controller.submitForm(),
                  child: Text('Submit', style: AppTextStyles.buttonFont),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

