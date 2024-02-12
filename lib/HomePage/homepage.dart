import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sajhabackup/EasyConst/Styles.dart';
import 'package:sajhabackup/HomePage/bach.dart';
import 'package:sajhabackup/Cart/CartPage.dart';
import 'package:sajhabackup/Chat/chat.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/HomePage/extra.dart';
import 'package:sajhabackup/HomePage/masters.dart';
import 'package:sajhabackup/MyBooksStatus/mybookstatus.dart';
import 'package:sajhabackup/Settings/settings.dart';
import 'package:sajhabackup/AddBooks/adddetails.dart';
import 'package:sajhabackup/pages/login.dart';
import 'package:sajhabackup/pages/recentlyadded.dart';
import 'package:sajhabackup/pages/search.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  //final currentUser = FirebaseAuth.instance.currentUser!;
  User? user = FirebaseAuth.instance.currentUser;
  final usersCollection = FirebaseFirestore.instance.collection("users");
  final currentUser = FirebaseAuth.instance.currentUser!;
   late String userName = ''; 
   late String profilepic='';

  void fetchUserName() async {
    try {
      if (user != null) {
        DocumentSnapshot userDoc = await usersCollection.doc(user!.uid).get();

        String name = userDoc['Full Name'];
        String picUrl = userDoc['ProfilePicUrl'];

        setState(() {
          userName = name;
          profilepic = picUrl;
        });
      }
    } catch (error) {
      print('Error fetching user name: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserName();
    fetchquote();
  }
  void fetchquote(){
    List <String> quotes=[
            "Books are a uniquely portable magic. - Stephen King",
           " A room without books is like a body without a soul. - Marcus Tullius Cicero",
           "The more that you read, the more things you will know. The more that you learn, the more places you'll go. - Dr. Seuss ",
           "A book is a dream that you hold in your hand. - Neil Gaiman",
           "You can never get a cup of tea large enough or a book long enough to suit me. - C.S. Lewis",
          "A reader lives a thousand lives before he dies. The man who never reads lives only one. - George R.R. Martin",
          "Books are the quietest and most constant of friends; they are the most accessible and wisest of counselors, and the most patient of teachers.- Charles W. Eliot",
          "I find television very educational. Every time someone turns it on, I go into another room and read a book. - Groucho Marx",
           "So many books, so little time. - Frank Zappa",
          "There is no friend as loyal as a book. - Ernest Hemingway",
          "Education is the most powerful weapon which you can use to change the world. - Nelson Mandela",
          "The function of education is to teach one to think intensively and to think critically. Intelligence plus character - that is the goal of true education. - Martin Luther King Jr.",
            "Education is the passport to the future, for tomorrow belongs to those who prepare for it today. - Malcolm X",
"Live as if you were to die tomorrow. Learn as if you were to live forever. - Mahatma Gandhi",
"The beautiful thing about learning is that no one can take it away from you. - B.B. King"

    ];
    DateTime now=DateTime.now();
    int quoteIndex=now.day%quotes.length;
    setState(() {
      qouteOfTheDay=quotes[quoteIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 550,
      child: SafeArea(
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            NetworkImage(
                "https://m.media-amazon.com/images/I/A12tbaSby+L._AC_UF1000,1000_QL80_.jpg"),
            NetworkImage(
                "https://prodimage.images-bn.com/pimages/9780545791427_p0_v4_s1200x630.jpg"),
            NetworkImage(
                "https://www.theodist.com/Images/ProductImages/Large/78775.jpg"),
                
                 NetworkImage(
                "https://i.ebayimg.com/images/g/OZIAAOSwItFeojCA/s-l400.jpg"),
                  NetworkImage(
                "https://english.onlinekhabar.com/wp-content/uploads/2023/08/Aatmabrittanta.jpg"),
            //AssetImage("images/book4.jpg"),
          ],
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
  
          dotSize: 3,
          dotSpacing: 15,
          indicatorBgPadding: 2,
          dotBgColor: Colors.transparent,
          showIndicator: false,
          dotVerticalPadding: -10,
          dotPosition: DotPosition.bottomCenter,
          dotIncreaseSize: 1.5,
        ),
      ),
    );
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Sajha Bookstore',
            style:
                TextStyle(color: Colors.white, fontFamily: bold, fontSize: 21)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => search()));
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: color),
              accountName: Text(
                userName,
                style: TextStyle(fontSize: 16, fontFamily: bold, color: color1),
              ),
              accountEmail: Text(
                currentUser.email!,
                style: TextStyle(fontSize: 14, fontFamily: bold, color: color1),
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(profilepic),
                ),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookListPage()));
              },
              child: ListTile(
                title: Text('All Books'),
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
                    MaterialPageRoute(builder: (context) => mybookstatus()));
              },
              child: ListTile(
                title: Text('My Books Status'),
                leading: Icon(Icons.star_outline_sharp, color: color),
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
                    onConfirmBtnTap: () async {
                      // Sign out the user from Firebase Authentication
                      await FirebaseAuth.instance.signOut();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const loginscreen()));
                    });
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
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text('Quote Of The Day',style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 18),),
                Text(
                  qouteOfTheDay,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
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
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookListPage()));
                    },
                    child: Text(
                      'See More',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ))
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color)),
                SizedBox(width: 20),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookListPage()));
                    },
                    child: Text(
                      'See More',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ))
              ],
            ),
          ),
          Container(
            height: 300,
            child: Bach(),
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color)),
                SizedBox(width: 20),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookListPage()));
                    },
                    child: Text(
                      'See More',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ))
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
