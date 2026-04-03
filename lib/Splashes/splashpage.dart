import 'package:flutter/material.dart';
import 'package:sajha_bookstore/EasyConst/colors.dart';
import 'package:sajha_bookstore/HomePage/HomePage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

//765EFC
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  void goToHome() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      backgroundColor: Colors.amberAccent,
                      strokeWidth: 2.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'Loading...',
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
