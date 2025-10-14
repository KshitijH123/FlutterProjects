import 'package:flutter/material.dart';
import 'package:login_firebase/register_user_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          'Login Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(onPressed: login, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[300],
            foregroundColor: Colors.white,
            minimumSize: Size(250, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            )
          )
          ,child: Text('Login',style: TextStyle(fontSize: 18),)),
          SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterUserScreen()),
              );
            },
            child: Text('Register User',style: TextStyle(color: Colors.blue[300])),
          ),
        ],
      ),
    );
  }
}
