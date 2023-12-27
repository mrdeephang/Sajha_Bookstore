//import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sajhabackup/main.dart';
//import 'package:quickalert/quickalert.dart';
import 'package:sajhabackup/pages/login.dart';

class verification extends StatelessWidget {
  

  @override
   final myloginbutton = Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF9526BC),
      child: MaterialButton(
        minWidth:20, 
        padding: EdgeInsets.all(12),
        onPressed: () {
                  
        },
        child: Text(
          'Verify',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => loginscreen())));
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.black),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Icon(Icons.dialpad_rounded, size: 50),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Enter the OTP",
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Otp(),
              Otp(),
              Otp(),
              Otp(),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Resend?",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 40),
          myloginbutton
        ],
      ),
    );
  }
}

class Otp extends StatelessWidget {
  const Otp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          hintText: ('0'),
        ),
        onSaved: (value) {},
      ),
    );
  }
}
