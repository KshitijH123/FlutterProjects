import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_example/logic/navigation%20using%20provider/app_state.dart';
import 'package:firebase_login_example/screens/home_screen.dart';
import 'package:firebase_login_example/screens/login_screen.dart';
import 'package:firebase_login_example/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(create: (_) => AppState(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: FutureBuilder<bool>(
        future: LocalStorage.instance.isUserLoggedIn(),
        builder: (context, snapshot) {
          final isUserLoggedIn = snapshot.data;

          return isUserLoggedIn == true ? HomeScreen(name: '', email: '',) : LoginScreen();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
