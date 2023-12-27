import 'package:flutter/material.dart';

class intro1 extends StatefulWidget {
  const intro1({Key? key}) : super(key: key);

  @override
  State<intro1> createState() => _intro1State();
}

class _intro1State extends State<intro1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.pink[100],
        child: Center(
          child: Text('Welcome', style: TextStyle(fontSize: 30)),
        ));
    //child: Image.asset('assets/images/logo.png', height: 200),
  }
}
