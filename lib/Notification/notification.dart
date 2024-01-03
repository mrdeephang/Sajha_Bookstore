import 'package:flutter/material.dart';
import 'package:sajhabackup/EasyConst/Styles.dart';

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
        title: Text('Notifications',
            style: TextStyle(color: Colors.white, fontFamily: regular)),
        backgroundColor: Color(0xFF9526BC),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text(
          'You have no notifications.',
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
              wordSpacing: 1
              //fontWeight: FontWeight.bold
              ),
        ),
      ),
    );
  }
}
