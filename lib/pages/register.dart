import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sajhabackup/Pages/login.dart';
import 'package:sajhabackup/Splashes/splashpage.dart';
import 'package:sajhabackup/utils/formcontainer.dart';
import 'package:sajhabackup/utils/firebase.dart';
import 'package:sajhabackup/utils/toast.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  bool isSigningUp = false;

  @override
  void dispose() {
    _fullnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                FormContainerWidget(
                  controller: _fullnameController,
                  hintText: "Full Name",
                  isPasswordField: false,
                ),
                SizedBox(height: 10),
                FormContainerWidget(
                  controller: _usernameController,
                  hintText: "Username",
                  isPasswordField: false,
                ),
                SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                  controller: _phoneController,
                  hintText: "Phone Number",
                  isPasswordField: false,
                ),
                SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
                SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                ),
                SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                  controller: _confirmpasswordController,
                  hintText: " Confirm Password",
                  isPasswordField: true,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    _signUp();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFF9526BC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: isSigningUp
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginscreen()),
                              (route) => false);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color(0xFF9526BC),
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });
    String fullname = _fullnameController.text;
    String username = _usernameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    addUser(
      _fullnameController.text.trim(),
      _usernameController.text.trim(),
      int.parse(_phoneController.text.trim()),
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "Registered Successfully");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashPage()));
    } else {
      showToast(message: "Some error happend");
    }
  }

  Future addUser(String fullname, String userName, int phone, String email,
      String pass) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Full Name': fullname,
      'Username': userName,
      'Phone': phone,
      'Email': email,
      'Password': pass,
    });
  }
}
