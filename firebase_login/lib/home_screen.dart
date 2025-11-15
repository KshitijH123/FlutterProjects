import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.name});
  final String name;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
        centerTitle: true,
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WellCome ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            Text(
              ' ${widget.name}  ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500,color: Colors.tealAccent),
            ),
          ],
        ),
      ),
    );
  }
}
