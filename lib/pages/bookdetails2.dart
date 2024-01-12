import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:provider/provider.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/EasyConst/Styles.dart';
import 'package:sajhabackup/pages/CartPage.dart';
import 'package:sajhabackup/pages/cartmodel.dart';
//import 'package:sajhabackup/pages/CartPage.dart';

class booksdetails2 extends StatelessWidget {
  final Map<String,dynamic> book;

  booksdetails2({required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: color,
        title: Text(
          book['name'],
          style: TextStyle(fontSize: 20, fontFamily: regular, color: color1),
        ),
        leading: BackButton(color: color1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InstaImageViewer(
                child: Image.network(
                  book['image_url'],
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Text(
                "Book Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Text(
                      'Author:',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(book['author']),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Text(
                      'Edition:',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(book['edition']),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Text(
                      'Price',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('\Rs.${book['price']}'),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Text(
                      'Condition:',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(book['condition']),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Text(
                      'Address:',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(book['address']),
                  )
                ],
              ),
              SizedBox(height: 10),
               Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                  child: Text(
                    'Additional Info:',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(book['additional_info']),
                )
              ],
            ),
            SizedBox(height: 10),
               Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                  child: Text(
                    'Added By:',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextButton(onPressed:(){},child: Text(book['added by'])),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Container(
                  color: color,
                   width: MediaQuery.of(context).size.width*0.4,  
                  child: TextButton(onPressed: (){}, child: Text('Buy',style: TextStyle(color: Colors.black),))),
                SizedBox(width: 2),
                Container(
                   //padding: EdgeInsets.only(right: 10),
                  color: color,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: TextButton(onPressed: (){
                     Provider.of<CartModel>(context, listen: false).addToCart(
            Book(
              name: book['name'],
              author: book['author'],
              imageUrl: book['image_url'],
              price: book['price'],
              
            ));
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                  }, child: Text('AddToCart',style: TextStyle(color: Colors.black)))),
              ],
            ),
            SizedBox(height: 10),
            Container(
              color: color,
              width: MediaQuery.of(context).size.width,
              child: TextButton(onPressed: (){}, child: Text('Chat With Seller',style: TextStyle(color: Colors.black)))),
            ],
          ),
        ),
      ),
    );
  }
}
