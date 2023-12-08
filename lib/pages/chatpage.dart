import 'package:flutter/material.dart';

class chatpage
extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: EdgeInsets.only(top:5),
          child: AppBar(
            backgroundColor: Colors.deepPurple,
            leadingWidth: 30,
            title: Row(
              children: [
                ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Icon(Icons.supervised_user_circle),
                      
                    ),
                    Padding(padding: EdgeInsets.only(left: 10),
                    child: Text("User",style: TextStyle(color: Colors.black),),
                    )
                
              ],
            ),
            actions: [
              Padding(padding: EdgeInsets.only(right:25),
              child: Icon(Icons.call),
              ),

            ],
          ),
        ),
      ),
      body: 
          Padding(padding: EdgeInsets.only(top:670),
         child: Container(
          alignment: Alignment.bottomCenter,
          height: 65,
          decoration: BoxDecoration(color: Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0,3)
          )
          ]
          ),
          
           child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.add,size: 30,),
              ),
              Padding(padding: EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.center,
                width: 270,
                child: TextFormField(decoration: InputDecoration(hintText: "Type Something",border: InputBorder.none)),
              ),
              ),
              Padding(padding: EdgeInsets.only(right: 5),
              child: Icon(Icons.send),
              )
            ],
           ),
         ),
          
          )
       
    );
  }
}