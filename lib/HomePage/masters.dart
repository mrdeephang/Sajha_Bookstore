import 'package:flutter/material.dart';
import 'package:sajhabackup/Pages/bookdetails.dart';

class masters extends StatefulWidget {
  @override
  State<masters> createState() => _mastersState();
}

class _mastersState extends State<masters> {
  var product_list = [
    {
      "name": "Psychology",
      "picture": "assets/images/M-psy.png",
      "Price": "1000"
    },
    {"name": "MBA", "picture": "assets/images/MBA.png", "Price": "2000"},
    {"name": "Economics", "picture": "assets/images/M-Eco.png", "Price": "900"},
    {"name": "Physics", "picture": "assets/images/M-phy.jpeg", "Price": "1500"},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext conntext, int index) {
          return Single_prod(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_price: product_list[index]['Price']);
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;

  Single_prod({
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