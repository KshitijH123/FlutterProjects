import 'package:another_telephony/telephony.dart';
import 'package:flutter/material.dart';

class SmsDetailScreen extends StatefulWidget {
  const SmsDetailScreen({super.key, required this.sms});
  final SmsMessage sms;

  @override
  State<SmsDetailScreen> createState() => _SmsDetailScreenState();
}

class _SmsDetailScreenState extends State<SmsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.sms.address ?? '',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        elevation: 2,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(widget.sms.body ?? '', style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
