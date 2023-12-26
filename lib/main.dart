import 'package:flutter/material.dart';
//import 'package:sajhabackup/home.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import 'package:sajhabackup/bachelors.dart';
import 'package:sajhabackup/extra.dart';
import 'package:sajhabackup/masters.dart';
import 'package:sajhabackup/pages/addbooks.dart';
import 'package:sajhabackup/pages/cart.dart';
import 'package:sajhabackup/pages/chat.dart';
import 'package:sajhabackup/pages/login.dart';
import 'package:sajhabackup/voice.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    routes: {
      '/': (context) => loginscreen(),
    },
    //home:homepage(),
  ));
}

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
        backgroundColor: Colors.deepPurple,
        title: Text('Sajha Bookstore', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => voice()));
              },
              icon: Icon(
                Icons.mic,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => cart()));
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
                color: Color(0xFF9526BC),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homepage()));
              },
              child: ListTile(
                title: Text('Home page'),
                leading: Icon(
                  Icons.home,
                  color: Color(0xFF9526BC),
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
                leading: Icon(Icons.chat_bubble, color: Color(0xFF9526BC)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addbooks()));
              },
              child: ListTile(
                title: Text('Add'),
                leading: Icon(Icons.add, color: Color(0xFF9526BC)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Account'),
                leading: Icon(Icons.supervised_user_circle,
                    color: Color(0xFF9526BC)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginscreen()));
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.logout, color: Color(0xFF9526BC)),
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
            child: Text(
              "Master's Level",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9526BC)),
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
            child: Text("Bachelor's Level",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9526BC))),
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
            child: Text("Extra",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9526BC))),
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
