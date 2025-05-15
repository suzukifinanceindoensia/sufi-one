import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sufi_one/app/modules/public/homepage_public/profile_page/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWObutton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: controller.registKey, //formKey from controller
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: controller.fullNameController,
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        border: OutlineInputBorder(),
                      ),
                      validator: controller.validateFullName,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      validator: controller.validateUsername,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: controller.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: controller.telpNumberController,
                      decoration: InputDecoration(
                        labelText: 'Nomor Telepon',
                        border: OutlineInputBorder(),
                      ),
                      validator: controller.validateTelpNumber,
                      keyboardType: TextInputType.phone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[+0-9]')),
                        LengthLimitingTextInputFormatter(15),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: controller.validatePassword,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: controller.confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Konfirmasi Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: controller.validateConfirmPassword,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.isChecked.value,
                          onChanged: (bool? value) {
                            controller.toggleChecked(value);
                          },
                        ),
                      ),
                      Text(
                        "I agree to the terms and conditions",
                        style: AppTextStyles.smallBody,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Obx(
                    () => ElevatedButton(
                      //wrap with obx
                      style: AppButtonStyle.primaryButtonStyle(),
                      onPressed:
                          controller.isChecked.value
                              ? () {
                                // Access the value here
                                controller.register();
                              }
                              : null,
                      child: Text('Register', style: AppTextStyles.buttonFont),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
