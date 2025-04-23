import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/modules/survey/controllers/process_survey_controller.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class ProcessSurveyView extends GetView<ProcessSurveyController> {
  const ProcessSurveyView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: SuzukiFinanceAppBarWObutton(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(labelText: 'Input String'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.addressController,
                  decoration: const InputDecoration(labelText: 'Input String'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.notesController,
                  decoration: const InputDecoration(labelText: 'Input Long String'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your notes';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                const Text('Pilihan Ganda 1', style: TextStyle(fontWeight: FontWeight.bold)),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.selectedOption1.value,
                    onChanged: (String? newValue) {
                      controller.selectedOption1.value = newValue;
                    },
                    items: controller.options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(labelText: 'Pilih salah satu'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                const Text('Pilihan Ganda 2', style: TextStyle(fontWeight: FontWeight.bold)),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.selectedOption2.value,
                    onChanged: (String? newValue) {
                      controller.selectedOption2.value = newValue;
                    },
                    items: controller.options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(labelText: 'Pilih salah satu'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                const Text('Pilihan Ganda 3', style: TextStyle(fontWeight: FontWeight.bold)),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.selectedOption3.value,
                    onChanged: (String? newValue) {
                      controller.selectedOption3.value = newValue;
                    },
                    items: controller.options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(labelText: 'Pilih salah satu'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Photo Upload
                const Text('Upload Photo', style: TextStyle(fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: controller.pickImage,
                  style: AppButtonStyle.primaryButtonStyle(),
                  child: Text('Pick Image',style: AppTextStyles.buttonFont,),
                ),
                Obx(
                  () => controller.selectedImage.value != null
                      ? Column(
                          children: [
                            const SizedBox(height: 10),
                            Image.file(
                              controller.selectedImage.value!,
                              height: 100,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.submitForm,
                  style: AppButtonStyle.primaryButtonStyle(),
                  child: Text('Submit',style: AppTextStyles.buttonFont,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}