import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/EasyConst/Styles.dart';
import 'package:sajhabackup/utils/toast.dart';
//import 'package:sajhabackup/Settings/Components/helpcenter.dart';

class UserProfilePage extends StatefulWidget {
  final String userEmail;

  UserProfilePage({required this.userEmail});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late CollectionReference _usersCollection;
  late DocumentSnapshot _userSnapshot;
    final currentUser = FirebaseAuth.instance.currentUser!;


  @override
  void initState() {
    super.initState();
    _usersCollection = FirebaseFirestore.instance.collection('users');
    _loadUserData();
  }

  void _loadUserData() {
    _usersCollection
        .where('Email', isEqualTo: widget.userEmail)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          _userSnapshot = querySnapshot.docs.first;
        });
      }
    });
  }

  void _reportUser(String reason) async {
    String reportedUserId = _userSnapshot.id;
    String reportedUserEmail = _userSnapshot['Email'];
    String reporterEmail = currentUser.email!; 

    await FirebaseFirestore.instance.collection('user_reports').add({
      'reportedUserId': reportedUserId,
      'reportedUserEmail': reportedUserEmail,
      'reporterEmail': reporterEmail,
      'reason': reason,
      'timestamp': FieldValue.serverTimestamp(),
    });
    showToast(message: 'Thank You For Yor Feedback!!!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Seller Profile',
          style: TextStyle(fontSize: 20, fontFamily: bold, color: color1),
        ),
        backgroundColor: color,
        leading: BackButton(color: color1),
      ),
      body: _userSnapshot != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _userSnapshot['ProfilePicUrl'] != null
                      ? Center(
                        child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(_userSnapshot['ProfilePicUrl']),
                            radius: 50,
                          ),
                      )
                      : Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage('assets/images/profile.jpg'),
                        ),
                      ),
                      SizedBox(height: 12,),
                   Container(
                     decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromARGB(255, 49, 2, 58).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
                     child: ListTile(
                        title:  Text('Name:'),
                        subtitle:Text(' ${_userSnapshot['Full Name']}'),
                       ),
                   ),
                   SizedBox(height: 10),
                  Container(
                     decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromARGB(255, 49, 2, 58).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
                    child: ListTile(
                    title:Text('Phone:'),
                    subtitle:  Text ('${_userSnapshot['Phone']}')),
                  ),
                  SizedBox(height: 10),
                  Container(
                     decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromARGB(255, 49, 2, 58).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
                    child: ListTile(
                    title:Text('Address:'),
                    subtitle:Text(' ${_userSnapshot['Address']}')),
                  ),
                  SizedBox(height: 10),
                  Container(
                     decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromARGB(255, 49, 2, 58).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
                    child: ListTile(
                    title:Text('Email:'),
                    subtitle:Text('${_userSnapshot['Email']}')),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Report User?',
                            style: TextStyle(
                                fontSize: 14, fontFamily: regular, color: color),
                          ),
                          backgroundColor: Colors.grey[300],
                          content: Column(
                            children: [
                              Text(
                                'Are you sure you want to report ${_userSnapshot['Full Name']}?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: regular,
                                ),
                              ),
                              SizedBox(height: 10),
                             
                              ListTile(
                                title: Text('Fake Profile'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _reportUser('Fake Profile');
                                },
                              ),
                              ListTile(
                                title: Text('Spam'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _reportUser('Spam');
                                },
                              ),
                              ListTile(
                                title: Text('Non Return of Rented Book'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _reportUser('Non Return of Rented Book');
                                },
                              ),
                              ListTile(
                                title: Text('High Price Added Of Books'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _reportUser('High Price Added Of Books');
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Report',
                      style: TextStyle(
                          fontSize: 14, fontFamily: regular, color: color),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
