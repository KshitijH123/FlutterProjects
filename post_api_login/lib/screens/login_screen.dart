import 'package:flutter/material.dart';
import 'package:post_api_login/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '𝖫𝗈𝗀𝗂𝗇 𝖲𝖼𝗋𝖾𝖾𝗇',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                hint: Text(
                  '𝖤𝗆𝖺𝗂𝗅',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                prefixIcon: const Icon(Icons.email, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                hint: Text(
                  '𝖯𝖺𝗌𝗌𝗐𝗈𝗋𝖽',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                suffixIcon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 45),
              backgroundColor: Color(0xFF205BC3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            onPressed: () {},
            child: Text(
              '𝖫𝗈𝗀𝗂𝗇',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 4),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            child: Text(
              '𝖱𝖾𝗀𝗂𝗌𝗍𝖾𝗋 𝖲𝖼𝗋𝖾𝖾𝗇',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF205BC3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
