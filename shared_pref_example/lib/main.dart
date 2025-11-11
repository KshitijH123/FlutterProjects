import 'package:flutter/material.dart';
import 'package:shared_pref_example/home_screen.dart';
import 'package:shared_pref_example/login_screen.dart';
import 'package:shared_pref_example/service/local_storage.dart';

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
