import 'package:flutter/material.dart';
import 'package:sajhabackup/EasyConst/style.dart';
import 'package:sajhabackup/HomePage/homepage.dart';
import 'package:sajhabackup/pages/chatpage.dart';
import 'package:sajhabackup/pages/recentchat.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white, foregroundColor: Colors.black)),
      routes: {"chatpage": (context) => chatpage()},
      home: chat(),
    ));

class chat extends StatelessWidget {
  const chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Chats',
            style: TextStyle(color: Colors.white, fontFamily: regular)),
        elevation: 0,
        backgroundColor: Color(0xFF9526BC),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => homepage()));
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: TextFormField(
                          decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      )),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          recentchat(),
        ],
      ),
    );
  }
}
