import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/EasyConst/Styles.dart';

class forgetpassword extends StatefulWidget {
  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwrodReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password Reset link sent! Check Your Email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        /*centerTitle: true,
        title: Text(
          'Forgot Password',
          style: TextStyle(fontSize: 20, fontFamily: bold, color: color1),
        ),*/
        backgroundColor: color,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
           child: Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),*/
          Container(
            child: Image.asset(
              'assets/images/forgot.png',
              height: 250,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: color),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter your email here...',
                hintStyle: TextStyle(
                    color: Colors.grey, fontFamily: regular, fontSize: 16),
                fillColor: color1,
                filled: true,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: color),
            child: TextButton(
              onPressed: passwrodReset,
              child: Text(
                'Reset Password',
                style:
                    TextStyle(fontSize: 16, fontFamily: regular, color: color1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
