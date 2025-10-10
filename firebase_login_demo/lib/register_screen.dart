import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confiormPasswordController = TextEditingController();

  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confiormPasswordController.text.trim();

    if (email.isEmpty) {
      showSnackBar('Input Email Address');
      return;
    }

    if (password.isEmpty) {
      showSnackBar('Input Password');
      return;
    }

    if (confirmPassword.isEmpty) {
      showSnackBar('Input Confirm Password');
      return;
    }

    if (password != confirmPassword) {
      showSnackBar('Confirm password is not matching the password');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password,);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),

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
            TextField(
              controller: confiormPasswordController,
              decoration: InputDecoration(
                hint: Text('Confirm Password'),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(onPressed: register, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
