import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/profile_page/controllers/profile_page_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class ProfileEditView extends GetView<ProfilePageController> {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.profileFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ubah Profil',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Terimakasih sudah bergabung dan menjadi bagian dari Suzuki Finance dan aplikasi Sufi Smart',
              ),
              const SizedBox(height: 24),
              _buildTextField(
                label: 'Nama Lengkap',
                controller: controller.nameController,
                validator: controller.validateName,
              ),
              _buildTextField(
                label: 'Nomor Telepon',
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                validator: controller.validatePhone,
              ),
              _buildDateField(
                label: 'Tanggal Lahir',
                controller: controller.birthDateController,
                onTap: () => controller.pickBirthDate(context),
              ),
              Obx(
                () => _buildDropdownField(
                  label: 'Gender',
                  value: controller.gender.value,
                  items: ['male', 'female'],
                  onChanged: (val) => controller.gender.value = val ?? '',
                  validator:
                      (val) =>
                          (val == null || val.isEmpty)
                              ? 'Pilih Gender terlebih dahulu'
                              : null,
                ),
              ),
              Obx(
                () => _buildDropdownField(
                  label: 'Pekerjaan',
                  value: controller.job.value,
                  items: [
                    'pegawai swasta',
                    'wiraswasta',
                    'mahasiswa',
                    'lainnya',
                  ],
                  onChanged: (val) => controller.job.value = val ?? '',
                  validator:
                      (val) =>
                          (val == null || val.isEmpty)
                              ? 'Pilih Pekerjaan terlebih dahulu'
                              : null,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Isi informasi No KTP dan nomor kontrak jika anda nasabah Suzuki Finance',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                label: 'No KTP',
                controller: controller.ktpController,
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                label: 'Nomor Kontrak 1',
                controller: controller.kontrak1Controller,
                keyboardType: TextInputType.number,
                validator: controller.validateOptionalContract,
              ),
              _buildTextField(
                label: 'Nomor Kontrak 2',
                controller: controller.kontrak2Controller,
                keyboardType: TextInputType.number,
                validator: controller.validateOptionalContract,
              ),
              _buildTextField(
                label: 'Nomor Kontrak 3',
                controller: controller.kontrak3Controller,
                keyboardType: TextInputType.number,
                validator: controller.validateOptionalContract,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    foregroundColor: AppColors.bg1,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    if (controller.profileFormKey.currentState?.validate() ??
                        false) {
                      controller.saveProfile();
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateField({
    required String label,
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.splashEnd),
          ),
        ),
        validator:
            (value) =>
                (value == null || value.isEmpty)
                    ? 'Field tidak boleh kosong'
                    : null,
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? hint,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.splashEnd),
          ),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: value.isNotEmpty ? value : null,
        dropdownColor: AppColors.bg1,
        decoration: InputDecoration(
          labelText: label,
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.splashEnd),
          ),
        ),
        items:
            items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item.toUpperCase()),
                  ),
                )
                .toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
