import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_example/login_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
