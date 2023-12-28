import 'package:flutter/material.dart';
import 'package:sajhabackup/pages/accountdetails.dart';
//import 'package:sajhabackup/pages/accountdetails.dart';

class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  bool showPassword=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        leading: BackButton(),
      ),
      body: Container(
        padding: EdgeInsets.only(left:16, top:25, right:16),
        child: GestureDetector(
          onTap: (){FocusScope.of(context).unfocus();},
          child: ListView(
            children: [
              Text("Edit Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 15,),
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
                            offset: Offset(0,10)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(fit:BoxFit.cover,image:AssetImage('assets/images/profile.jpg'), 
                        )
                      ),
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
                          color: Theme.of(context).scaffoldBackgroundColor,
                        )
                      ),
                      child: Icon(Icons.edit,color: Colors.white,),
                    ))
                  ],
                ),
              ),
              SizedBox(height:35 ),
              buildTextField("Name","Esparsh Tamrakar",false),
              buildTextField("Phone","9809454069",false),
              buildTextField("Address","Sanepa",false),
             buildTextField("Email","atamrakarrocker69@gmail.com",false),
             buildTextField("Password","************",true),
             SizedBox(height: 35),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>accountdetails()));
                    }, child: Text('Cancel',
                  style: TextStyle(fontSize: 14,letterSpacing: 2.2),
                  )),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    
                    onPressed: (){}, child: Text('Save',
                  style: TextStyle(fontSize: 14,letterSpacing: 2.2),
                  )),
                ),
              ],
             )
              
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom:35),
      child: TextField(
        obscureText: isPasswordTextField ?showPassword:false,
                decoration: InputDecoration(
                  suffixIcon: isPasswordTextField ? IconButton(
                    icon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                    
                    onPressed: (){
                      setState(() {
                        showPassword=!showPassword;
                      });
                    },
                  ):null,
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)
                ),
              ),
    );
  }
}