import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();

  static const String keyName = "name";

  var nameValue = "No Value Saved";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shared Pref',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setString(keyName, nameController.text.toString());
              },
              child: Text('Save'),
            ),
            SizedBox(height: 16),
            Text(nameValue,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();

    var getName = prefs.getString(keyName);

    nameValue = getName ?? "No Value Saved ";

    setState(() {});
  }
}
