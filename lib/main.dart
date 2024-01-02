import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sajhabackup/EasyConst/style.dart';
import 'package:sajhabackup/HomePage/homepage.dart';
//import 'package:sajhabackup/splashs/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splashscreen(),
  ));
}
