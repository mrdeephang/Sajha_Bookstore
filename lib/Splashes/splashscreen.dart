import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sajha_bookstore/EasyConst/colors.dart';
import 'package:sajha_bookstore/EasyConst/styles.dart';
import 'package:sajha_bookstore/HomePage/HomePage.dart';
import 'package:sajha_bookstore/Pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          if (user != null) {
            return HomePage(); // Replace with the desired page for the condition
          } else {
            return MainPage(); // Replace with the desired page for the else condition
          }
        }),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/logo.png",
              width: 250,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 8, top: 200),
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
          Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '"तपाईको Online Bookstore"',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: regular,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 1,
                    letterSpacing: 1),
              ))
        ],
      ),
    );
  }
}
