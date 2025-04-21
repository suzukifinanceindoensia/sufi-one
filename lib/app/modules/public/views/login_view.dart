import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/public/controllers/login_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/widgets/button.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class LoginPage extends GetView<LoginController> {
  // Use GetView<LoginController>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWObutton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Center(
                child: Text("Selamat Datang Kembali",style: AppTextStyles.bigBodyBold,textAlign: TextAlign.center,),
              ),
              Center(
                child: Text("Masukan Email dan Kata Sandi Anda yang Terdaftar di SUFIONE", style: AppTextStyles.bigBody,textAlign: TextAlign.center,),
              ),
              const SizedBox(height: 60,),
              Form(
                key: controller.formKey,
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 400,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SingleChildScrollView(
                    child: 
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 350,
                            height: 70,
                            child: TextFormField(
                              controller: controller.emailController,
                              decoration: InputDecoration(
                                  labelText: 'Email', border: OutlineInputBorder()),
                              validator: controller.validateEmail,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 350,
                            height: 70,
                            child: TextFormField(
                              controller: controller.passwordController,
                              decoration: InputDecoration(
                                  labelText: 'Password', border: OutlineInputBorder()),
                              obscureText: true,
                              validator: controller.validatePassword,
                            ),
                          ),
                          const SizedBox(height: 20),
                          normalButton(
                            onPressed: () {
                              controller.login();
                            },
                            child: Text("Login",style: AppTextStyles.button),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed('public/forgot_password');
                              },
                              child: Text('Forget Password?', style: AppTextStyles.smallBody,),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed('/public/register');
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Belum punya akun? ',
                                      style: AppTextStyles.smallBody
                                    ),
                                    TextSpan(
                                      text: 'Daftar sekarang',
                                      style: AppTextStyles.smallBodyBold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}