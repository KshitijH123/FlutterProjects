import 'package:flutter/material.dart';
import 'package:login_practice/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final name = nameController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty && password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('name or password is empty')));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(name: name)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        children: [
          SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hint: Text('User Name'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hint: Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(onPressed: login, child: Text('Login')),
        ],
      ),
    );
  }
}
