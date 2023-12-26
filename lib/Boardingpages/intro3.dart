import 'package:flutter/material.dart';

class intro3 extends StatefulWidget {
  const intro3({Key? key}) : super(key: key);

  @override
  State<intro3> createState() => _intro3State();
}

class _intro3State extends State<intro3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo.png',
                height: 350,
              ),
            ),
            // ignore: avoid_unnecessary_containers
          ],
        ));
  }
}
