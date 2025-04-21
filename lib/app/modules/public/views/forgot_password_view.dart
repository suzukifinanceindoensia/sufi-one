import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/forgot_password.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';


class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWObutton(),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child : SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  height: 400,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Enter your email address to receive a password reset link.',
                          style: AppTextStyles.bigBody,
                          textAlign: TextAlign.center,
                          ),),
                          const SizedBox(height: 100),
                          TextFormField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            validator: controller.validateEmail,
                          ),
                          const SizedBox(height: 20),
                          Obx(
                            () => ElevatedButton(
                              style: Button.elevbutton,
                              onPressed: controller.isButtonEnabled.value
                                  ? () {
                                      controller.resetPassword();
                                    }
                                  : null, // disable kalo logo load
                              child: controller.isButtonEnabled.value
                                  ? Text('Reset Password', style: AppTextStyles.button,)
                                  : CircularProgressIndicator(), 
                            ),
                          ),
                        ],
                      ),
                  ),
              ],
            )
            )
          ),
        )
      );
  }
}