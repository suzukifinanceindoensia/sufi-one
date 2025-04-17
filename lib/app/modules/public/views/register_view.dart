import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sufi_one/app/modules/public/controllers/register_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/button.dart'; 
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Get.toNamed('/public/login');
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: controller.formKey, //formKey from controller
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
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
                          border: OutlineInputBorder()),
                      validator: controller.validateFullName,
                    ),
                  ),
                  SizedBox(height: 70,
                    child: TextFormField(
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder()),
                      validator: controller.validateUsername,
                    ),
                  ),
                  SizedBox(height: 70,
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                      validator: controller.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 70,
                    child: TextFormField(
                      controller: controller.telpNumberController,
                      decoration: InputDecoration(
                          labelText: 'Nomor Telepon',
                          border: OutlineInputBorder()),
                      validator: controller.validateTelpNumber,
                      keyboardType: TextInputType.phone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[+0-9]')),
                        LengthLimitingTextInputFormatter(15),
                      ],
                    ),
                  ),
                  SizedBox(height: 70,
                    child: TextFormField(
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder()),
                      obscureText: true,
                      validator: controller.validatePassword,
                    ),
                  ),
                  SizedBox(height: 70,
                    child: TextFormField(
                      controller: controller.confirmPasswordController,
                      decoration: InputDecoration(
                          labelText: 'Konfirmasi Password',
                          border: OutlineInputBorder()),
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
                      Text("I agree to the terms and conditions"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Obx(() =>  ElevatedButton( //wrap with obx
                    onPressed: controller.isChecked.value ? () {  // Access the value here
                      controller.register();
                    } : null,
                    child: Text('Register'),
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