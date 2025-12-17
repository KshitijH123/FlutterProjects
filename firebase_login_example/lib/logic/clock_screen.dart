import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          'Area Of Triangle',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: 95,
                height: 95,
                color: Colors.teal[200],
                child: Center(
                  child: StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return Text(
                        DateTime.now().hour % 12 == 0
                            ? "12"
                            : (DateTime.now().hour % 12).toString().padLeft(
                                2,
                                '0',
                              ),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Text(
              ':',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: 95,
                height: 95,
                color: Colors.teal[200],
                child: Center(
                  child: StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return Text(
                        DateTime.now().minute.toString().padLeft(2, '0'),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Text(
              ':',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: 95,
                height: 95,
                color: Colors.teal[200],
                child: Center(
                  child: StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return Text(
                        DateTime.now().second.toString().padLeft(2, '0'),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
