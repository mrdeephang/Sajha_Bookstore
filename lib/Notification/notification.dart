import 'package:flutter/material.dart';
import 'package:sajhabackup/EasyConst/style.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification',
            style: TextStyle(color: Colors.white, fontFamily: regular)),
        backgroundColor: Color(0xFF9526BC),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
    );
  }
}
