import 'package:flutter/material.dart';

class booksdetails extends StatefulWidget {
  final book_name;
  final book_price;
  final book_author;
  final book_edition;
  final book_condition;
  final book_pic;
  booksdetails(
      {this.book_name,
      this.book_price,
      this.book_author,
      this.book_edition,
      this.book_condition,
      this.book_pic});

  @override
  State<booksdetails> createState() => _bookdetailsState();
}

class _bookdetailsState extends State<booksdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF9526BC),
        title: Text('Sajha Bookstore'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
          //IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.white,))
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.book_pic),
              ),
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
                          "\Rs.${widget.book_price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Color(0xFF9526BC),
                  textColor: Colors.black,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Text(
                        "Buy Now",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.deepPurple,
                  textColor: Colors.black,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Text(
                        "Rent",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.deepPurple,
                  textColor: Colors.black,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Text(
                        "Add To Cart",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Book Details:'),
            //subtitle: Text(''),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Author:',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(widget.book_author),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Condition:',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(widget.book_condition),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Edition:',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(widget.book_edition),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Publisher:',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Sajha Publication"),
              )
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'More Books',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            height: 360,
            child: similarbooks(),
          )
        ],
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
