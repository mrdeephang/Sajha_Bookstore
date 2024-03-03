import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pinput/pinput.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/pages/RegisterPage.dart';

class OtpPage extends StatefulWidget {
  final String vid;
  final String phone;
  const OtpPage({super.key, required this.vid, required this.phone});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  var code = '';
  signIn() async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: widget.vid, smsCode: code);
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        Get.offAll(RegisterPage(phone: widget.phone));
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Occured', e.code);
    } catch (e) {
      Get.snackbar('Error Occured', e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: color1,
        leading: BackButton(color: color),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            /*
            Center(
              child: Text(
                'OTP VERIFICATION',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),*/
            Container(
              child: Image.asset(
                'assets/images/otp.png',
                height: 250,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            /*  Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6),
             child: Text(
                " Enter The OTP ",
                style: TextStyle(fontFamily: regular, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            */
            SizedBox(height: 20),
            textcode(),
            SizedBox(height: 20),
            button()
          ],
        ),
      ),
    );
  }

  Widget textcode() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Pinput(
          length: 6,
          onChanged: (value) {
            setState(() {
              code = value;
            });
          },
        ),
      ),
    );
  }

  Widget button() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          signIn();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          primary: color,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 90),
          child: Text(
            'Verify & Proceed',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
