import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/forgot_password.dart';


class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child : Center(
          child: Form(
            key: controller.formKey,
            child: Container(
              padding: const EdgeInsets.all(25),
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Enter your email address to receive a password reset link.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: controller.validateEmail,
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => ElevatedButton(
                      onPressed: controller.isButtonEnabled.value
                          ? () {
                              controller.resetPassword();
                            }
                          : null, // disable kalo lago load
                      child: controller.isButtonEnabled.value
                          ? Text('Reset Password')
                          : CircularProgressIndicator(), 
                    ),
                  ),
                ],
              ),
            )
          ),
        )
      ),
    );
  }
}