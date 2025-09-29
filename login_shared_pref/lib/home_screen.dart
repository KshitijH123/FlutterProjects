import 'package:flutter/material.dart';
import 'package:todo_shared_pref/login_screen.dart';
import 'package:todo_shared_pref/services/local_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          spacing: 24,
          children: [
            Text('Welcome ${LocalStorage.instance.getUserName()}'),
            ElevatedButton(
              onPressed: () {
                LocalStorage.instance.logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
