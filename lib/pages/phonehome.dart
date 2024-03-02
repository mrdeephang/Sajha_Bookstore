import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/pages/verification.dart';

class PhoneHome extends StatefulWidget {
  const PhoneHome({super.key});

  @override
  State<PhoneHome> createState() => _PhoneHomeState();
}

class _PhoneHomeState extends State<PhoneHome> {
  TextEditingController phoneNumber=TextEditingController();
  sendcode() async{
    try{
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+977'+phoneNumber.text,
        verificationCompleted: (PhoneAuthCredential crendential){},
         verificationFailed: (FirebaseAuthException e){
          Get.snackbar('Error Occured', e.code);
         },
          codeSent: (String vid,int ? token){
            Get.to(OtpPage(vid:vid,phone:phoneNumber.text));
          }, 
          codeAutoRetrievalTimeout: (vid){}
          );
    }on FirebaseAuthException catch(e){
      Get.snackbar('Error Occured', e.code);
    }catch(e){
      Get.snackbar('Error Occured', e.toString());
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Text('Your Phone!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
           
          ),
           Padding(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 6),
              child: Text("Please Enter Your Phone Number and We will send you an OTP"),
            ),
            SizedBox(height: 20),
            phonetext(),
            SizedBox(height: 50),
            button()
        ],
      ),
    );
  }
  Widget button(){
    return Center(
      child: ElevatedButton(
        onPressed: (){
          sendcode();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          primary: Color.fromRGBO(90, 208, 248, 1)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 90),
          child: Text('Receive OTP',style: TextStyle(fontWeight: FontWeight.bold),),
          
        ),
      ),
    );
  }
  Widget phonetext(){
    return Padding(padding: EdgeInsets.symmetric(horizontal: 50),
    child: TextField(
      controller: phoneNumber,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefix: Text('+977'),
        prefixIcon: Icon(Icons.phone),
        labelText: 'Enter Your Phone Number',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color)
        )
      ),
    ),
    );
  }
}