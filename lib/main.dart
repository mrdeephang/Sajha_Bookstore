import 'package:flutter/material.dart';
import 'package:sajhabackup/EasyConst/style.dart';
import 'package:sajhabackup/splashs/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF9526BC)),
        fontFamily: regular,
      ),
      home: splashscreen(),
    );
  }
}
