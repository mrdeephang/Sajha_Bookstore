import 'package:flutter/material.dart';

class intro2 extends StatefulWidget {
  const intro2({Key? key}) : super(key: key);

  @override
  State<intro2> createState() => _intro2State();
}

class _intro2State extends State<intro2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.deepPurple[100],
        child: Center(
          child: Text('To', style: TextStyle(fontSize: 30)),
        ));
  }
}
