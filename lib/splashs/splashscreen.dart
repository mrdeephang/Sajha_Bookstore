import 'package:flutter/material.dart';
import 'package:sajhabackup/pages/login.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    _navigatetologin();
  }

  _navigatetologin() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => loginscreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF9526BC),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo.png',
                height: 350,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                padding: EdgeInsets.only(left: 75, top: 475),
                child: Text(
                  'Buy, Sell & Rent Books',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2,
                      letterSpacing: 2),
                )),
            Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '"तपाईको Online Bookstore"',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1,
                      letterSpacing: 1),
                ))
          ],
        ));
  }
}
