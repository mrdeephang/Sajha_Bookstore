import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sajhabackup/EasyConst/style.dart';
import 'package:sajhabackup/Widgets/helptile.dart';

class helpcenter extends StatefulWidget {
  const helpcenter({Key? key}) : super(key: key);

  @override
  State<helpcenter> createState() => _helpcenterState();
}

class _helpcenterState extends State<helpcenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Help Center',
            style: TextStyle(color: Colors.white, fontFamily: regular)),
        backgroundColor: Color(0xFF9526BC),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              helptile(
                color: Color(0xFF9526BC),
                icon: Ionicons.call,
                title: "Call Us",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              helptile(
                color: Color(0xFF9526BC),
                icon: Ionicons.mail_open,
                title: "Email Us",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
