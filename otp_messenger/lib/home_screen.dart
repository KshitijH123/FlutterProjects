import 'package:another_telephony/telephony.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:otp_messenger/sms_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<SmsMessage>>? futureMessages;
  int selectedIndex = 0;
  bool isPushing = false;

  @override
  void initState() {
    super.initState();
    futureMessages = getAllMesseges();
    listenForNewSMS();

    setupFCM();
  }

  void setupFCM() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(alert: true, badge: true, sound: true);

    await messaging.subscribeToTopic('otp_users');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('FCM Foreground Message Received');
      debugPrint('Title: ${message.notification?.title}');
      debugPrint('Body: ${message.notification?.body}');
    });
  }

  void listenForNewSMS() {
    Telephony.instance.listenIncomingSms(
      onNewMessage: (SmsMessage message) async {
        await Future.delayed(Duration(milliseconds: 1000));
        futureMessages = getAllMesseges();
        setState(() {});
      },
      listenInBackground: false,
    );
  }

  Future<List<SmsMessage>> getAllMesseges() async {
    final telephony = Telephony.instance;
    final permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
    if (permissionsGranted == true) {
      return telephony.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY, SmsColumn.DATE],
        sortOrder: [OrderBy(SmsColumn.DATE, sort: Sort.DESC)],
      );
    }
    return [];
  }

  bool looksLikeOtp(String? text) {
    if (text == null || text.trim().isEmpty) return false;
    final lower = text.toLowerCase();
    const otpKeywords = [
      'otp',
      'one time',
      'verification code',
      'verification',
      'login code',
      'security code',
      'confirm code',
      'pin code',
      'passcode',
    ];
    for (final word in otpKeywords) {
      if (lower.contains(word)) return true;
    }
    final codeRegex = RegExp(r'(?<!\d)(\d{4,8})(?!\d)');
    if (codeRegex.hasMatch(text)) return true;
    return false;
  }

  String? extractOtp(String? text) {
    if (text == null) return null;
    final codeRegex = RegExp(r'(?<!\d)(\d{4,8})(?!\d)');
    final match = codeRegex.firstMatch(text);
    return match?.group(0);
  }

  Future<void> pushOtps() async {
    if (isPushing) return;

    setState(() {
      isPushing = true;
    });

    final messages = await futureMessages;

    if (messages == null || messages.isEmpty) {
      showSnackBar('No messages to push', isError: true);
      setState(() {
        isPushing = false;
      });

      return;
    }

    final otpMessages = messages.where((m) => looksLikeOtp(m.body)).toList();

    if (otpMessages.isEmpty) {
      showSnackBar('No OTP messages found to push', isError: true);
      setState(() {
        isPushing = false;
      });
      return;
    }

    final DatabaseReference dbRef = FirebaseDatabase.instance.ref(
      'otp_messages',
    );

    Map<String, dynamic> allOtpData = {};

    for (final sms in otpMessages) {
      final otp = extractOtp(sms.body);
      final pushKey = dbRef.push().key;

      if (pushKey != null) {
        allOtpData[pushKey] = {
          'address': sms.address ?? 'Unknown',
          'body': sms.body ?? '',
          'otp_code': otp ?? '',
          'date': sms.date != null
              ? DateTime.fromMillisecondsSinceEpoch(sms.date!).toIso8601String()
              : DateTime.now().toIso8601String(),
          'timestamp': ServerValue.timestamp,
          'synced_at': DateTime.now().toIso8601String(),
        };
      }
    }

    await dbRef.update(allOtpData);

    showSnackBar(
      'Successfully pushed ${otpMessages.length} OTP messages to Firebase!',
      isError: false,
    );

    setState(() {
      isPushing = false;
    });
  }

  void showSnackBar(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        elevation: 4,
        centerTitle: true,
      ),
      floatingActionButton: selectedIndex == 1
          ? FloatingActionButton.extended(
              onPressed: isPushing ? null : pushOtps,
              icon: isPushing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.cloud_upload),
              label: Text(isPushing ? 'Syncing...' : 'Sync to Firebase'),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
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
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No SMS found'));
          }

          final messages = snapshot.data!;
          final showOnlyOtp = (selectedIndex == 1);
          final displayedMessages = showOnlyOtp
              ? messages.where((m) => looksLikeOtp(m.body)).toList()
              : messages;

          if (displayedMessages.isEmpty) {
            return Center(
              child: Text(
                showOnlyOtp ? 'No OTP messages found' : 'No SMS found',
              ),
            );
          }

          return ListView.builder(
            itemCount: displayedMessages.length,
            itemBuilder: (context, index) {
              final sms = displayedMessages[index];
              final otp = extractOtp(sms.body);
              final subtitle = sms.body ?? '';
              return Card(
                child: ListTile(
                  title: Text(
                    sms.address ?? 'Unknown',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (otp != null && showOnlyOtp)
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Row(
                            children: [
                              const Icon(Icons.vpn_key, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                'Code: $otp',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
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
