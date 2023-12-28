/*import 'package:flutter/material.dart';
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
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10, top: 200),
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
*/
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
    goToHome();
  }

  void goToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const loginscreen()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xFF9526BC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 250,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      backgroundColor: Colors.amberAccent,
                      strokeWidth: 2.0,
                    ),
                    width: 24,
                    height: 24,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
