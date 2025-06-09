import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/login/controllers/register_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: controller.registKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Registrasi',
                  style: AppTextStyles.Navybodymed.copyWith(
                    color: AppColors.button,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Silahkan lengkapi informasi data diri anda',
                  style: AppTextStyles.medBodyBold.copyWith(
                    color: AppColors.button,
                  ),
                ),
                const SizedBox(height: 20),
                buildInputField(
                  label: 'Nama Lengkap',
                  controller: controller.fullNameController,
                  validator: controller.validateFullName,
                ),
                buildInputField(
                  label: 'Nomor Telepon',
                  controller: controller.telpNumberController,
                  validator: controller.validateTelpNumber,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[+0-9]')),
                    LengthLimitingTextInputFormatter(15),
                  ],
                ),
                buildInputField(
                  label: 'Email',
                  controller: controller.emailController,
                  validator: controller.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                GestureDetector(
                  onTap: () => controller.pickBirthDate(context),
                  child: AbsorbPointer(
                    child: buildInputField(
                      label: 'Tanggal Lahir',
                      controller: controller.birthDateController,
                      validator:
                          (_) =>
                              controller.birthDateController.text.isEmpty
                                  ? 'Tanggal lahir wajib diisi'
                                  : null,
                    ),
                  ),
                ),
                Obx(
                  () => buildPasswordField(
                    label: 'Kata Sandi',
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    toggleVisibility:
                        () => controller.isPasswordHidden.toggle(),
                    validator: controller.validatePassword,
                  ),
                ),
                Obx(
                  () => buildPasswordField(
                    label: 'Konfirmasi Kata Sandi',
                    controller: controller.confirmPasswordController,
                    obscureText: controller.isConfirmPasswordHidden.value,
                    toggleVisibility:
                        () => controller.isConfirmPasswordHidden.toggle(),
                    validator: controller.validateConfirmPassword,
                  ),
                ),
                Obx(
                  () => DropdownButtonFormField<String>(
                    dropdownColor: AppColors.bg1,
                    decoration: InputDecoration(
                      labelText: 'Jenis Kelamin',
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.iconDefault),
                      ),
                    ),

                    value:
                        controller.selectedGender.value.isNotEmpty
                            ? controller.selectedGender.value
                            : null,
                    onChanged: (value) {
                      if (value != null) {
                        controller.selectedGender.value = value;
                      }
                    },
                    items:
                        ['Male', 'Female']
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ),
                            )
                            .toList(),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Pilih jenis kelamin'
                                : null,
                  ),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => DropdownButtonFormField<String>(
                    dropdownColor: AppColors.bg1,
                    decoration: InputDecoration(
                      labelText: 'Pekerjaan',
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.iconDefault),
                      ),
                    ),

                    value:
                        controller.selectedJob.value.isNotEmpty
                            ? controller.selectedJob.value
                            : null,
                    onChanged: (value) {
                      if (value != null) {
                        controller.selectedJob.value = value;
                      }
                    },
                    items:
                        [
                              'PNS',
                              'Mahasiswa',
                              'Pensiunan',
                              'Wirausaha',
                              'Pegawai Swasta',
                              'Lainnya',
                            ]
                            .map(
                              (job) => DropdownMenuItem(
                                value: job,
                                child: Text(job),
                              ),
                            )
                            .toList(),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Pilih pekerjaan'
                                : null,
                  ),
                ),

                const SizedBox(height: 10),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.isChecked.value,
                        onChanged: (value) => controller.toggleChecked(value),
                        fillColor: WidgetStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.button; // saat dicentang
                          }
                          return Colors.white; // saat tidak dicentang
                        }),
                        side: BorderSide(color: AppColors.button, width: 2),
                        checkColor: AppColors.bg1,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Saya menyetujui syarat dan ketentuan",
                        style: AppTextStyles.smallBodyBold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Obx(
                  () => Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.button,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed:
                            controller.isChecked.value
                                ? () => controller.register()
                                : null,
                        child: Text(
                          'Register',
                          style: AppTextStyles.buttonFont,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          labelText: label,
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.iconDefault),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback toggleVisibility,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.iconDefault),
          ),
          suffixIcon: IconButton(
            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: toggleVisibility,
          ),
        ),
      ),
    );
  }
}
