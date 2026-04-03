import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:sajha_bookstore/AddBooks/bookdetails.dart';
import 'package:sajha_bookstore/AddBooks/bookdetails2.dart';
import 'package:sajha_bookstore/EasyConst/colors.dart';

class masters extends StatefulWidget {
  const masters({super.key});

  @override
  State<masters> createState() => _mastersState();
}

class _mastersState extends State<masters> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchBooksFromFirebase(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: color));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var productList = snapshot.data ?? [];
          return GridView.builder(
            // scrollDirection:Axis.horizontal ,
            itemCount: productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return SingleProd(
                prodName: productList[index]['name'],
                prodPicture: productList[index]['image_url'],
                prodPrice: productList[index]['price'].toDouble(),
                prodAuthor: productList[index]['author'],
                prodCondition: productList[index]['condition'],
                prodEdition: productList[index]['edition'],
                prodAddInfo: productList[index]['additional_info'],
                prodAddress: productList[index]['address'],
                prodStatus: productList[index]['status'],

                prodAddedBy: productList[index]['added by'],
              );
            },
          );
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetchBooksFromFirebase() async {
    final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection('books')
        .where('category', isEqualTo: 'Masters')
        .limit(6)
        .get();

    return result.docs.map((doc) => doc.data()).toList();
  }
}

class SingleProd extends StatelessWidget {
  final String prodName;
  final String prodPicture;
  final double prodPrice;
  final String prodStatus;

  final String prodAuthor;
  final String prodCondition;
  final String prodEdition;
  final String prodAddress;
  final String prodAddInfo;
  final String prodAddedBy;
  const SingleProd({
    super.key,
    required this.prodName,
    required this.prodPicture,
    required this.prodPrice,
    required this.prodAuthor,
    required this.prodCondition,
    required this.prodEdition,
    required this.prodAddInfo,
    required this.prodAddedBy,
    required this.prodAddress,
    required this.prodStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BooksDetails2(
                  book: {
                    'name': prodName,
                    'image_url': prodPicture,
                    'author': prodAuthor,
                    'edition': prodEdition,
                    'price': prodPrice,
                    'condition': prodCondition,
                    'address': prodAddress,
                    'additional_info': prodAddInfo,
                    'added by': prodAddedBy,
                    'status': prodStatus,
                  },
                ),
              ),
            ),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        prodName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Rs$prodPrice',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              child: Image.network(prodPicture, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
