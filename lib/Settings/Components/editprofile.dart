import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/EasyConst/Styles.dart';
import 'package:sajhabackup/Settings/Components/accountdetails.dart';
//import 'package:sajhabackup/Settings/Components/accountdetails.dart';

class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  bool showPassword = false;
    User? user=FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 20, fontFamily: regular, color: color1),
        ),
        backgroundColor: color,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body:  Container(
        child: StreamBuilder(stream: FirebaseFirestore.instance.collection("users").where("Email",isEqualTo:user?.email).snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text('Something Went Wrong');
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CupertinoActivityIndicator());
          }
          if(snapshot.data!.docs.isEmpty){
            return Text("No data Found");
          }
          if(snapshot!=null && snapshot.data!=null){
            return ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (context,index){
              return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 20),
            buildTextField('Name', snapshot.data!.docs[index]['Full Name'], false),
            const SizedBox(height: 10),
            buildTextField('Phone',  snapshot.data!.docs[index]['Phone'], false),
            const SizedBox(height: 10),
            buildTextField('Address', snapshot.data!.docs[index]['Address'], false),
            const SizedBox(height: 10),
            buildTextField(
                'Email', snapshot.data!.docs[index]['Email'], false),
            const SizedBox(
              height: 20,
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccDetails()));
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(fontSize: 14, letterSpacing: 2.2),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                          onPressed: () {
                           
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: 14, letterSpacing: 2.2),
                          )),
                    ),
                  ],
                ),
              )
            
          ],
        ),
      );
            });
          }
          return Container();
        },),
      ),
    );
  }
  


  Padding buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}

/*
class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 20, fontFamily: regular, color: color1),
        ),
        backgroundColor: color,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/profile.jpg'),
                          )),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              )),
                          child: Icon(
                            Icons.edit,
                            color: color,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 35),
              buildTextField("Name", "Esparsh Tamrakar", false),
              buildTextField("Phone", "9809454069", false),
              buildTextField("Address", "Sanepa", false),
              buildTextField("Email", "atamrakarrocker69@gmail.com", false),
              buildTextField("Password", "************", true),
              SizedBox(height: 10),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccDetails()));
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(fontSize: 14, letterSpacing: 2.2),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccDetails()));
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: 14, letterSpacing: 2.2),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
*/
