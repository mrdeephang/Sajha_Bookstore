import 'package:flutter/material.dart';

class Book {
  final String name;
  final String author;
  final String imageUrl;
  final double price;

  Book({
    required this.name,
    required this.author,
    required this.imageUrl,
    required this.price,
  });
}

class CartPage extends StatefulWidget {
  final List<Book> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
 
  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (var book in widget.cartItems) {
     
      total += 10.0;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: widget.cartItems.isEmpty
          ? Center(
              child: Text('Your cart is empty.'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      var book = widget.cartItems[index];
                      return _buildCartItem(book);
                    },
                  ),
                ),
                _buildTotalAndCheckoutButtons(total),
              ],
            ),
    );
  }

  Widget _buildCartItem(Book book) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          book.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(book.name),
        subtitle: Text('Author: ${book.author}'),
        trailing: Text('\Rs.${book.price}'),
      ),
    );
  }

  Widget _buildTotalAndCheckoutButtons(double total) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blueGrey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total: \Rs${total.toStringAsFixed(2)}'),
          ElevatedButton(
            onPressed: () {
             
              print('Checkout pressed');
            },
            child: Text('Checkout'),
          ),
        ],
      ),
    );
  }
}