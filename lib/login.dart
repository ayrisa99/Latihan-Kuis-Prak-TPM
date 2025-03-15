import 'package:flutter/material.dart';
import 'package:latihankuis/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            constraints: const BoxConstraints(maxWidth: 350),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FlutterLogo(size: 100),
                  const SizedBox(height: 16),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text("Login Untuk Mengakses Lebih Banyak Fitur"),
                  const SizedBox(height: 16),

                  // Username Input
                  TextFormField(
                    controller: _username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username Harus Diisi";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Password Input
                  TextFormField(
                    controller: _password,
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password Harus Diisi';
                      }
                      if (value.length < 4) {
                        return 'Password minimal 4 karakter';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_username.text == "fulan" &&
                              _password.text == "fulan") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Login Berhasil'),
                                backgroundColor: Colors.green,
                              ),
                            );

                            // Pindah ke HomePage dengan username
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => Home(username: _username.text),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Username atau password salah'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
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
