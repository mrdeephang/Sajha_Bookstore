import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sajha_bookstore/Chat/chat.dart';
import 'package:sajha_bookstore/EasyConst/colors.dart';
import 'package:sajha_bookstore/EasyConst/styles.dart';
//import 'package:sajha_bookstore/Pages/cart.dart';
import 'package:sajha_bookstore/Cart/cart_page.dart';
import 'package:sajha_bookstore/Cart/cartmodel.dart';

class BooksDetails extends StatefulWidget {
  final book_name;
  final book_price;
  final book_author;
  final book_edition;
  final book_condition;
  final book_pic;
  const BooksDetails({
    super.key,
    this.book_name,
    this.book_price,
    this.book_author,
    this.book_edition,
    this.book_condition,
    this.book_pic,
  });

  @override
  State<BooksDetails> createState() => _BooksDetailsState();
}

class _BooksDetailsState extends State<BooksDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: color,
        title: Text(
          'Sajha Bookstore',
          style: TextStyle(fontSize: 20, fontFamily: regular, color: color1),
        ),
        leading: BackButton(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          //IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.white,))
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    widget.book_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Rs.${widget.book_price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 219, 38, 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.book_pic),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  width: 20,
                  child: FloatingActionButton(
                    backgroundColor: color,
                    onPressed: () {
                      try {
                        Provider.of<CartModel>(
                          context,
                          listen: false,
                        ).addToCart(
                          Book(
                            name: widget.book_name,
                            author: widget.book_author,
                            imageUrl: widget.book_pic,
                            price: widget.book_price,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartPage()),
                        );
                      } catch (e) {
                        print("Error: $e");
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Buy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: SizedBox(
                  height: 40,
                  width: 20,
                  child: FloatingActionButton(
                    backgroundColor: color,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rent",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 40,
                  width: 20,
                  child: FloatingActionButton(
                    backgroundColor: color,
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false).addToCart(
                        Book(
                          name: widget.book_name,
                          author: widget.book_author,
                          imageUrl: widget.book_pic,
                          price: widget.book_price,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Expanded(
            child: SizedBox(
              height: 40,
              width: 20,
              child: FloatingActionButton(
                backgroundColor: color,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chat()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chat with Seller",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(height: 2),
          ListTile(
            title: Text(
              'Book Details:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //subtitle: Text(''),
          ),
          Divider(height: 2),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text('Author:', style: TextStyle(color: Colors.blue)),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text('Ram Hari Mishra'),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text('Condition:', style: TextStyle(color: Colors.blue)),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(widget.book_condition),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text('Edition:', style: TextStyle(color: Colors.blue)),
              ),
              Padding(padding: EdgeInsets.all(5), child: Text('1st')),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text('Publisher:', style: TextStyle(color: Colors.blue)),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Sajha Publication"),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text('Address:', style: TextStyle(color: Colors.blue)),
              ),
              Padding(padding: EdgeInsets.all(5), child: Text("Budanilkantha")),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Explore  More',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(height: 360, child: Similarbooks()),
        ],
      ),
    );
  }
}

class Similarbooks extends StatefulWidget {
  const Similarbooks({super.key});

  @override
  State<Similarbooks> createState() => _SimilarbooksState();
}

class _SimilarbooksState extends State<Similarbooks> {
  var product_list = [
    {
      "name": "Goosebumps:Special Edition",
      "picture": "assets/images/s1.png",
      "Price": "1000",
    },
    {
      "name": "Sherlock Holmes",
      "picture": "assets/images/s2.jpg",
      "Price": "1000",
    },
    {
      "name": "Harry Potter:The Cursed Child",
      "picture": "assets/images/s3.png",
      "Price": "1000",
    },
    {
      "name": "The Fabulous Five",
      "picture": "assets/images/s4.png",
      "Price": "1000",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext conntext, int index) {
        return SimilarSingleProd(
          prod_name: product_list[index]['name'] ?? "",
          prod_picture: product_list[index]['picture'] ?? "",
          prod_price: product_list[index]['Price'] ?? "",
        );
      },
    );
  }
}

class SimilarSingleProd extends StatelessWidget {
  final String prod_name;
  final String prod_picture;
  final String prod_price;

  const SimilarSingleProd({
    super.key,
    required this.prod_name,
    required this.prod_picture,
    required this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BooksDetails(
                  book_name: prod_name,
                  book_pic: prod_picture,
                  book_price: prod_price,
                  book_condition: "Used",
                  book_author: "-",
                  book_edition: "-",
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
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Rs$prod_price',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              child: Image.asset(prod_picture, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
