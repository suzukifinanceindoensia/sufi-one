import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/public/widgets/button.dart';
import 'package:get/get.dart';

final List<Map<String, String>> users = [
  {'email': 'test', 'password': '123'},
  {'email': 'admin', 'password': 'admin1'}, 
];

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }
  void _login() {
    if (_formKey.currentState!.validate()) {
      final username = _emailController.text;
      final password = _passwordController.text;
      // validasi
      bool authenticated = users.any((user) =>
          user['email'] == username && user['password'] == password);

      if (authenticated) {
        // berhasil masuk
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );
        Get.toNamed('/public/home');
      } else {
        // gagal masuk
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(15),
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  height: 50,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email',border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // You can add more email validation here
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                normalButton(
                  onPressed: _login,
                  child: Text("Login")
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child : TextButton(
                    onPressed: () {},
                    child: Text('Forget Password?'),
                  ),
                ), 
                Align(
                  alignment: Alignment.centerLeft,
                  child : TextButton(
                    onPressed: () {},
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
                        ]
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
}