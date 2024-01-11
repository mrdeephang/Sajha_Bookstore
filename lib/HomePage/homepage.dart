//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sajhabackup/Chat/chat.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/HomePage/bachelors.dart';
import 'package:sajhabackup/HomePage/extra.dart';
import 'package:sajhabackup/HomePage/masters.dart';
import 'package:sajhabackup/Notification/notification.dart';
import 'package:sajhabackup/Pages/login.dart';
import 'package:sajhabackup/Settings/settings.dart';
import 'package:sajhabackup/pages/CartPage.dart';
import 'package:sajhabackup/pages/adddetails.dart';
import 'package:sajhabackup/pages/recentlyadded.dart';
import 'package:sajhabackup/pages/search.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 250,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          NetworkImage(
              "https://w7.pngwing.com/pngs/377/407/png-transparent-paperback-book-cover-publishing-physics-cover-book-text-wholesale-business.png"),
          NetworkImage(
              "https://w7.pngwing.com/pngs/998/703/png-transparent-chemistry-units-1-2-matter-molecule-book-chemistry-book-chemistry-curriculum-electric-blue.png"),
          NetworkImage(
              "https://www.theodist.com/Images/ProductImages/Large/78775.jpg"),
          //AssetImage("images/book4.jpg"),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        //borderRadius: true,
        dotSize: 3,
        dotSpacing: 15,
        indicatorBgPadding: 2,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Sajha Bookstore', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>search()));
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => notification()));
              },
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Esparsh Tamrakar'),
              accountEmail: Text('esparsh.tamrakar@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: color,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homepage()));
              },
              child: ListTile(
                title: Text('Home'),
                leading: Icon(
                  Icons.home,
                  color: color,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => chat()));
              },
              child: ListTile(
                title: Text('Chat'),
                leading: Icon(Icons.chat_bubble, color: color),
              ),
            ),
              InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => BookListPage()));
              },
              child: ListTile(
                title: Text('Recently Added'),
                leading: Icon(Icons.add_alert_outlined, color: color),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookAddPage()));
              },
              child: ListTile(
                title: Text('Add'),
                leading: Icon(Icons.add, color: color),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: color),
              ),
            ),
            InkWell(
              onTap: () {
                QuickAlert.show(
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    confirmBtnColor: color,
                    context: context,
                    type: QuickAlertType.confirm,
                    title: "LogOut",
                    text: "Are you sure you want to logout?",
                    onConfirmBtnTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => loginscreen())));
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.logout, color: color),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          image_carousel,
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                Text(
                  "Master's Level",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: color),
                ),
                SizedBox(width: 20),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookListPage()));
                }, child: Text('See More',style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: color),))
              ],
            ),
          ),
          Container(
            height: 300,
            child: masters(),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                Text("Bachelor's Level",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: color)),
                         SizedBox(width: 20),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookListPage()));
                }, child: Text('See More',style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: color),))
              ],
            ),
          ),
          Container(
            height: 300,
            child: bach(),
          ),

          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                Text("Extra",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: color)),
                         SizedBox(width: 20),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookListPage()));
                }, child: Text('See More',style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: color),))
              ],
            ),
          ),
          Container(
            height: 300,
            child: extra(),
          ),

          //
        ],
      ),
    );
  }
}


