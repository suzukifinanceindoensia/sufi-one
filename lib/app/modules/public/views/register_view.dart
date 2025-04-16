import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sufi_one/app/modules/public/widgets/button.dart'; // Import for TextInputFormatter
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _telpNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama Lengkap harus diisi';
    }
    return null;
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username harus diisi';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email harus diisi';
    }
    
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  String? _validateTelpNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor Telepon harus diisi';
    }
     // gk pake +62, cuma pake no telp yang biasa
    final phoneRegex = RegExp(r'^[+0-9]+$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Nomor Telepon tidak valid';
    }
    if (value.length < 10) {
      return 'Nomor Telepon minimal 10 angka';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password harus diisi';
    }
    
    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi Password harus diisi';
    }
    if (value != _passwordController.text) {
      return 'Password berbeda';
    }
    return null;
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      
      String fullName = _fullNameController.text;
      String username = _usernameController.text;
      String email = _emailController.text;
      String telpNumber = _telpNumberController.text;
      String password = _passwordController.text;

      print('Full Name: $fullName');
      print('Username: $username');
      print('Email: $email');
      print('Telp Number: $telpNumber');
      print('Password: $password');

      Get.toNamed('/public/login');
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrasi Berhasil!')),
      );
      _fullNameController.clear();
      _usernameController.clear();
      _emailController.clear();
      _telpNumberController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register'), automaticallyImplyLeading: false),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.arrow_back),
        onPressed: (){
          Get.toNamed('/public/login');
        },),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
            height: 500,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 70,
                  child: TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(labelText: 'Nama Lengkap', border: OutlineInputBorder()),
                    validator: _validateFullName,
                  ),
                ),
                SizedBox(height: 70,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Username', border: OutlineInputBorder()),
                    validator: _validateUsername,
                  ),
                ),
                
                SizedBox(height: 70,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                
                SizedBox(height: 70,
                  child: TextFormField(
                    controller: _telpNumberController,
                    decoration: InputDecoration(labelText: 'Nomor Telepon', border: OutlineInputBorder()),
                    validator: _validateTelpNumber,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[+0-9]')), // Allow only numbers and +
                      LengthLimitingTextInputFormatter(15), //optional
                    ],
                  ),
                ),
                
                SizedBox(height: 70,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                    obscureText: true,
                    validator: _validatePassword,
                  ),
                ),
                
                SizedBox(height: 70,
                child: TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(labelText: 'Konfirmasi Password', border: OutlineInputBorder()),
                    obscureText: true,
                    validator: _validateConfirmPassword,
                  ),
                ),
                SizedBox(height: 10),
                normalButton(
                  onPressed: _register,
                  child: Text('Register'),
                ),
              ],
            ),
            )
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _telpNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
