import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/public/controllers/login_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/button.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  // Use GetView<LoginController>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
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
              child: Column(
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
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  normalButton(
                    onPressed: () {
                      controller.login();
                    },
                    child: Text("Login"),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Forget Password?'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('/public/register');
                      },
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Belum punya akun? ',
                            ),
                            TextSpan(
                              text: 'Daftar sekarang',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}