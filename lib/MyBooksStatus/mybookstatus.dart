import 'package:flutter/material.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/EasyConst/Styles.dart';

class mybookstatus extends StatefulWidget {
  const mybookstatus({super.key});

  @override
  State<mybookstatus> createState() => _mybookstatusState();
}

class _mybookstatusState extends State<mybookstatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Books Status',
          style: TextStyle(fontSize: 20, fontFamily: regular, color: color1),
        ),
        backgroundColor: color,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text(
          'You have no books added.',
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
