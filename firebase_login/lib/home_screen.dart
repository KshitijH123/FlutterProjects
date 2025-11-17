import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.name, required this.email});
  final String name;
  final String email;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void logout() {
    FirebaseAuth.instance.signOut();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(onTap: logout, child: Icon(Icons.logout)),
            SizedBox(width: 24),
            Text('Home screen'),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WellCome ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                Text(
                  ' ${widget.name}  ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.tealAccent,
                  ),
                ),
                Text(
                  '!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.email,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
