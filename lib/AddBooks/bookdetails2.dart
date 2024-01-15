import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:provider/provider.dart';
import 'package:sajhabackup/AddBooks/bookdetails.dart';
import 'package:sajhabackup/Chat/chatpage.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/EasyConst/Styles.dart';
import 'package:sajhabackup/pages/CartPage.dart';
import 'package:sajhabackup/pages/RentDetails.dart';
import 'package:sajhabackup/pages/cartmodel.dart';
import 'package:sajhabackup/utils/maps.dart';
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
              SizedBox(height: 18),
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
              SizedBox(height: 7),
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
              SizedBox(height: 7),
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
              SizedBox(height: 7),
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
              SizedBox(height: 7),
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
                    child: TextButton(
                      onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (
                       (context)=> MapOpenPage(destinationAddress: book['address'],)
                      ))),
                    child: Text(book['address'],style: TextStyle(color: Colors.red),)),
                  )
                ],
              ),
              SizedBox(height: 7),
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
            SizedBox(height: 7),
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
                    child: Text(book['added by']),
                  )
                ],
              ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: color,
                  // width: MediaQuery.of(context).size.width*0.4,  
                  child: TextButton(onPressed: (){}, child: Text('Buy',style: TextStyle(color: Colors.black),))),
                SizedBox(width: 2),
                Container(
                   //padding: EdgeInsets.only(right: 10),
                  color: color,
                  //width: MediaQuery.of(context).size.width*0.4,
                  child: TextButton(onPressed: (){
                     Provider.of<CartModel>(context, listen: false).addToCart(
            Book(
              name: book['name'],
              author: book['author'],
              imageUrl: book['image_url'],
              price: book['price'].toDouble(),
              
            ));
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                  }, child: Text('AddToCart',style: TextStyle(color: Colors.black)))),
                  Container(
                    color: Colors.deepPurple[200],
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RentingExplanationPage()));
                    }, child: Text('Rent')))
              ],
            ),
            SizedBox(height: 10),
            Container(
              color: color,
              width: MediaQuery.of(context).size.width,
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>chatpage(receiveruserEmail: book['added by'], receiverId: "")));
              }, child: Text('Chat With Seller',style: TextStyle(color: Colors.black)))),
               Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Explore  More',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            height: 360,
            child: similarbooks(),
          )
            ],
          ),
        ),
      ),
    );
  }
}
class similarbooks extends StatefulWidget {
  @override
  State<similarbooks> createState() => _similarbooksState();
}

class _similarbooksState extends State<similarbooks> {
  var product_list = [
    {
      "name": "Goosebumps:Special Edition",
      "picture": "assets/images/s1.png",
      "Price": "1000"
    },
    {
      "name": "Sherlock Holmes",
      "picture": "assets/images/s2.jpg",
      "Price": "1000"
    },
    {
      "name": "Harry Potter:The Cursed Child",
      "picture": "assets/images/s3.png",
      "Price": "1000"
    },
    {
      "name": "The Fabulous Five",
      "picture": "assets/images/s4.png",
      "Price": "1000"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext conntext, int index) {
          return Similar_Single_prod(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_price: product_list[index]['Price']);
        });
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;

  Similar_Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
            child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => booksdetails(
                    book_name: prod_name,
                    book_pic: prod_picture,
                    book_price: prod_price,
                    book_condition: "Used",
                    book_author: "-",
                    book_edition: "-",
                  ))),
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    prod_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Text(
                    '\Rs${prod_price}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            child: Image.asset(
              prod_picture,
              fit: BoxFit.cover,
            ),
          ),
        )),
      ),
    );
  }
}
