import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_demo/home_screen.dart';
import 'package:firebase_login_demo/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (user.user != null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }

  void navigateToRegisterScreen() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          spacing: 24,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hint: Text('Email'),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hint: Text('Password'),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(onPressed: login, child: Text('Login')),
            TextButton(
              onPressed: navigateToRegisterScreen,
              child: Text('Register User'),
            ),
          ],
        ),
      ),
    );
  }
}
