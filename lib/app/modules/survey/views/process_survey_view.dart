import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/modules/survey/controllers/process_survey_controller.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class ProcessSurveyView extends GetView<ProcessSurveyController> {
  const ProcessSurveyView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Process Survey'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Text Form Fields
                TextFormField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.notesController,
                  decoration: const InputDecoration(labelText: 'Notes'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your notes';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Multiple Choice 1
                Text('Multiple Choice 1', style: AppTextStyles.medBodyBold),
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
                    decoration: const InputDecoration(labelText: 'Select Option 1'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Multiple Choice 2
                Text('Multiple Choice 2', style: AppTextStyles.medBodyBold),
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
                    decoration: const InputDecoration(labelText: 'Select Option 2'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Multiple Choice 3
                Text('Multiple Choice 3', style: AppTextStyles.medBodyBold),
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
                    decoration: const InputDecoration(labelText: 'Select Option 3'),
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
                Text('Upload Photo', style: AppTextStyles.medBodyBold),
                ElevatedButton(
                  style: AppButtonStyle.primaryButtonStyle(),
                  onPressed: controller.pickImage,
                  child: Text('Pick Image',style: AppTextStyles.buttonFont,),
                ),
                Obx(
                  () => controller.selectedImage.value != null
                      ? Column(
                          children: [
                            const SizedBox(height: 10),
                            Image.file(
                              controller.selectedImage.value!,
                              height: 300,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: AppButtonStyle.primaryButtonStyle(),
                  onPressed: controller.submitForm,
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