import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sajhabackup/Splashes/splashpage.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  XFile? _pickedImage;
  bool _isPasswordVisible = false;
  String _verificationId = "";

  Future<void> _pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }

  Future<void> _register() async {
    try {
      if (_validateForm()) {
        await _auth.verifyPhoneNumber(
          phoneNumber: '+977${_phoneController.text.trim()}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            UserCredential userCredential = await _auth.signInWithCredential(credential);
            await _completeRegistration(userCredential.user!.uid);
          },
          verificationFailed: (FirebaseAuthException e) {
            print('Error during phone verification: $e');
          },
          codeSent: (String verificationId, int? resendToken) {
            setState(() {
              _verificationId = verificationId;
            });
            _showOtpDialog();
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            setState(() {
              _verificationId = verificationId;
            });
          },
        );
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }

  Future<void> _showOtpDialog() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter OTP'),
        content: Column(
          children: [
            TextFormField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: _verificationId,
                    smsCode: _otpController.text,
                  );
                  UserCredential userCredential = await _auth.signInWithCredential(credential);
                  await _completeRegistration(userCredential.user!.uid);
                  Navigator.of(context).pop(); 
                } catch (e) {
                  print('Error during OTP verification: $e');
                }
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _completeRegistration(String userId) async {
    try {
      if (_pickedImage != null) {
        await _uploadProfilePicture(userId);
      }

      await _firestore.collection('users').doc(userId).set({
        'Full Name': _fullNameController.text,
        'Address': _addressController.text,
        'Username': _usernameController.text,
        'Phone': _phoneController.text,
        'Email': _emailController.text.trim(),
        'Password': _passwordController.text,
        'ProfilePicUrl': _pickedImage != null ? await _getProfilePicUrl(userId) : null,
        'uid': userId,
      });

      await _auth.currentUser!.sendEmailVerification();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SplashPage()),
      );
    } catch (e) {
      print('Error during registration: $e');
    }
  }

  Future<String?> _getProfilePicUrl(String userId) async {
    try {
      final ref = FirebaseStorage.instance.ref().child('profile_pic/$userId.jpg');
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error getting profile picture URL: $e');
      return null;
    }
  }

  Future<void> _uploadProfilePicture(String userId) async {
    try {
      final Reference storageReference =
          FirebaseStorage.instance.ref().child('profile_pic/$userId.jpg');
      await storageReference.putFile(
        File(_pickedImage!.path),
        SettableMetadata(contentType: 'image/jpeg'),
      );
    } catch (e) {
      print('Error uploading profile picture: $e');
    }
  }

  bool _validateForm() {
    if (_fullNameController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        (_pickedImage == null)) {
      _showErrorDialog('All fields must be filled');
      return false;
    } else if (_passwordController.text != _confirmPasswordController.text) {
      _showErrorDialog('Passwords do not match');
      return false;
    }
    return true;
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                  image: _pickedImage != null
                      ? DecorationImage(
                          image: FileImage(File(_pickedImage!.path)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: IconButton(
                  onPressed: _pickImage,
                  icon: Icon(
                    Icons.camera_alt,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue,
                ),
                child: TextButton(
                  onPressed: _register,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
