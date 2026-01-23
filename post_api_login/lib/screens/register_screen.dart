import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        dateOfBirthController.text =
            '${pickedDate.year}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '𝖢𝗋𝖾𝖺𝗍𝖾 𝖠𝖼𝖼𝗈𝗎𝗇𝗍',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                '𝖲𝗂𝗀𝗇 𝗎𝗉 𝗍𝗈 𝗀𝖾𝗍 𝗌𝗍𝖺𝗋𝗍𝖾𝖽 !',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  hint: Text(
                    '𝖥𝗎𝗅𝗅 𝖭𝖺𝗆𝖾',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  prefixIcon: const Icon(Icons.person, color: Colors.grey),
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
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TextField(
                controller: emailController,
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
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  hint: Text(
                    '𝖴𝗌𝖾𝗋 𝖭𝖺𝗆𝖾',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  prefixIcon: const Icon(
                    Icons.alternate_email,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TextField(
                controller: phoneNoController,
                decoration: InputDecoration(
                  hint: Text(
                    '𝖯𝗁𝗈𝗇𝖾 𝖭𝗈.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  prefixIcon: const Icon(Icons.phone, color: Colors.grey),
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
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TextField(
                controller: cityController,
                decoration: InputDecoration(
                  hint: Text(
                    '𝖢𝗂𝗍𝗒',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
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
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TextField(
                controller: dateOfBirthController,
                decoration: InputDecoration(
                  hint: Text(
                    '𝖣𝖺𝗍𝖾 𝗈𝖿 𝖡𝗂𝗋𝗍𝗁',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  prefixIcon: const Icon(
                    Icons.calendar_month_sharp,
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
                readOnly: true,
                onTap: () {
                  selectDate();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TextField(
                controller: passwordController,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  hint: Text(
                    '𝖢𝗈𝗇𝖿𝗂𝗋𝗆 𝖯𝖺𝗌𝗌𝗐𝗈𝗋𝖽',
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
                '𝖲𝗂𝗀𝗇 𝖴𝗉',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 18),
            Center(
              child: Text(
                '─────────  𝖮𝗋 𝗌𝗂𝗀𝗇 𝗎𝗉 𝗐𝗂𝗍𝗁  ─────────',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn-teams-slug.flaticon.com/google.jpg',
                  ),
                  radius: 32,
                ),
                SizedBox(width: 25),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/018/930/698/non_2x/facebook-logo-facebook-icon-transparent-free-png.png',
                  ),
                  backgroundColor: Colors.white,
                  radius: 32,
                ),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
