import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:sajha_bookstore/Cart/cartmodel.dart';
import 'package:sajha_bookstore/Splashes/splashscreen.dart';
import 'package:sajha_bookstore/themes/themeprovider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: dotenv.env['FIREBASE_API_KEY'] ?? '',
            appId: dotenv.env['FIREBASE_APP_ID'] ?? '',
            messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '',
            projectId: dotenv.env['FIREBASE_PROJECT_ID'] ?? '',
            storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '',
          ),
        )
      : await Firebase.initializeApp();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SplashScreen(),
    );
  }
}
