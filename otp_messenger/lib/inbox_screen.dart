import 'package:another_telephony/telephony.dart';
import 'package:flutter/material.dart';
import 'package:otp_messenger/otp_screen.dart';
import 'package:otp_messenger/sms_detail_screen.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  Future<List<SmsMessage>>? futureMessages;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    futureMessages = requestPermissions();
    listenForNewSMS();
  }

  void listenForNewSMS() {
    Telephony.instance.listenIncomingSms(
      onNewMessage: (SmsMessage message) async {
        await Future.delayed(Duration(milliseconds: 500));
        futureMessages = requestPermissions();
        setState(() {});
      },
      listenInBackground: false,
    );
  }

  Future<List<SmsMessage>> requestPermissions() async {
    final telephony = Telephony.instance;

    final permissionsGranted = await telephony.requestPhoneAndSmsPermissions;

    if (permissionsGranted == true) {
      return telephony.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
        // filter: SmsFilter.where(
        //   SmsColumn.ADDRESS,
        // ).equals("1234567890").and(SmsColumn.BODY).like("starwars"),
        sortOrder: [OrderBy(SmsColumn.DATE, sort: Sort.DESC)],
      );
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inbox',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        elevation: 2,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtpScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.sms), label: 'All'),
          BottomNavigationBarItem(icon: Icon(Icons.lock), label: 'OTP'),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: FutureBuilder<List<SmsMessage>>(
        future: futureMessages,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: Text('No SMS fond'));
          }

          final messages = snapshot.data!;

          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final sms = messages[index];
              return Card(
                child: ListTile(
                  title: Text(
                    sms.address ?? '',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(sms.body ?? ''),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SmsDetailScreen(sms: sms),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
