import 'package:flutter/material.dart';
import 'package:sajhabackup/main.dart';
import 'package:sajhabackup/pages/register.dart';


TextStyle mystyle=TextStyle(fontSize: 25);

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {

  String user='';
  String pass='';
  
  
  
  @override
  Widget build(BuildContext context) {
    final userfield=TextField(
      onChanged: (val){
        setState(() {
          user=val;
        });
      },
    style: mystyle,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(10),
      hintText: "username",
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
    ),
    
  );
  final password=TextField(
    onChanged: (val){
        setState(() {
          pass=val;
        });
      },
    obscureText: true,
    style: mystyle,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(10),
      hintText: "Password",
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
    ),
    
  );
    final myloginbutton=Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(30),
    color: Colors.deepPurple,
    child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      onPressed: (){
        if(user=="esparsh"&& pass=="Password123"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
        }else{
          print("falied");
        }
      },
      child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 25),),
    ),
    );
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding:EdgeInsets.all(20) ,
            child:ListView(
              children: [
                 Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Container(
                  child:  Image.asset(
                    'assets/images/logo.png',
                    height: 170,
                  ),
                ),
                SizedBox(height: 100),
                userfield,
                SizedBox(height: 20),
                password,
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                       TextButton(
                        onPressed: (){},
                         child: Text('Forgot Password?',
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey),),
                       ),]
                  ),
                ),
                SizedBox(height: 40),
                myloginbutton,
                Divider(thickness: 0.5,color: Colors.grey[400],),
                 Text(
                 'Or Connect With',
                   style: TextStyle(color: Colors.black),
                 ),
                 
                 SizedBox(height: 8),
                 Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 150.0),
                          child: Row(
                            children: [
                              //googlebutton
                              Image.asset(
                                'assets/images/google.png',
                                height: 60,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          
                            Text('Not a member?'),
                            SizedBox(width: 4),
                            TextButton(onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                            },
                             child:Text('Register Now',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                             )
                          ],
                        )
                 

              ],
            ),
              ],
            )
            ),
        ),
      ),

    );
  }
}