import 'package:flutter/material.dart';
import 'package:todo_shared_pref/home_screen.dart';
import 'package:todo_shared_pref/login_screen.dart';
import 'package:todo_shared_pref/services/local_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FutureBuilder<bool>(
        future: LocalStorage.instance.isUserLoggedIn(),
        builder: (context, snapshot) {
          final isUserLoggedIn = snapshot.data;
          
          return isUserLoggedIn == true ? HomeScreen() : LoginScreen();
        },
      ),
    );
  }
}
