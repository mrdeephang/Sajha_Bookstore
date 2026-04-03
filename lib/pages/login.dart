import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sajha_bookstore/EasyConst/colors.dart';
import 'package:sajha_bookstore/EasyConst/styles.dart';
import 'package:sajha_bookstore/Splashes/splashpage.dart';
import 'package:sajha_bookstore/pages/forgotpassword.dart';
import 'package:sajha_bookstore/pages/phonehome.dart';
import 'package:sajha_bookstore/services/auth_service.dart';
import 'package:sajha_bookstore/utils/toast.dart';

TextStyle mystyle = TextStyle(fontSize: 25);

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.surface,
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginScreen();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  static Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("no user found");
      }
    }
    return user;
  }

  String user = '';
  String pass = '';
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final userfield = TextField(
      controller: _emailController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        hintText: "Email or Phone",
        hintStyle: TextStyle(
          fontSize: 18,
          fontFamily: regular,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      ),
    );

    final myloginbutton = Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(30),
      color: color,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12),
        onPressed: () async {
          User? user = await loginUsingEmailPassword(
            email: _emailController.text,
            password: _passwordController.text,
            context: context,
          );
          print(user);
          if (user != null) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SplashPage()),
            );
          } else {
            showToast(
              message:
                  "Incorrect Password or Email or Check Your Internet Connection",
            );
          }
        },
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset('assets/images/logo.png', height: 250),
                    ),
                    Container(
                      child: const Text(
                        'Buy, Sell & Rent Books',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          letterSpacing: 1,
                          wordSpacing: 1,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    userfield,
                    SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: regular,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                    SizedBox(height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPassword(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    myloginbutton,
                    SizedBox(height: 10),
                    Divider(thickness: 1, color: Colors.grey[400]),
                    SizedBox(height: 10),
                    Text(
                      'Or Connect With',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 140),
                      child: Row(
                        children: [
                          //googlebutton
                          GestureDetector(
                            onTap: () =>
                                FirebaseService.signInwithGoogle(context),
                            child: Image.asset(
                              'assets/images/google.png',
                              height: 55,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(
                            fontFamily: regular,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 1),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhoneHome(),
                              ),
                            );
                          },
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
