import 'package:flutter/material.dart';
import 'package:sajhabackup/main.dart';
import 'package:sajhabackup/pages/verification.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.deepPurple),),
               
              SizedBox(height: 20),
              Text('Create an Account',
              style: TextStyle(fontSize: 15,color: Colors.grey[700]),
              ),
               ],
              ),
              Column(
                children: [
                   inputFile(label: "First Name"),
                    inputFile(label: "Last Name"),
                    inputFile(label: "UserName"),
                  inputFile(label: "Email"),
                   inputFile(label: "Phone Number"),
                  inputFile(label: "Password",obscureText: true),
                  inputFile(label: "Confirm Password",obscureText: true),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3,left: 3),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(50), 
                    
                  
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>verification()));
                  }, 
                  child: Text('Next >',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.deepPurple),))
                ],
              )
              
            ],
          ),
          
        ),
      ),
    );
  }
}
Widget inputFile({label,obscureText=false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,

        ),
      ),
      SizedBox(height: 5),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            )
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            )
          )
        ),
      ),
      SizedBox(height: 10)
    ],
  );
}