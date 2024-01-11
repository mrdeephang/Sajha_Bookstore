import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sajhabackup/pages/cartmodel.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartModel = Provider.of<CartModel>(context);

    // Calculate total price
    double totalPrice = cartModel.cartItems.fold(
        0, (previousValue, book) => previousValue + book.price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: cartModel.cartItems.isEmpty
                    ? Text('Your cart is empty.')
                    : ListView.builder(
                        itemCount: cartModel.cartItems.length,
                        itemBuilder: (context, index) {
                          var book = cartModel.cartItems[index];
                          return Card(
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                             // leading: Image.asset(book.imageUrl,width: 40,height: 40,),
                              title: Text(book.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    book.imageUrl,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  Text('Author: ${book.author}'),
                                  
                                  Text('Price: \Rs${book.price.toStringAsFixed(2)}'),
                                ],
                              ),
        
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  // Remove the book from the cart
                                  cartModel.removeFromCart(book);
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price: \Rs.${totalPrice.toStringAsFixed(2)}'),
                  ElevatedButton(
                    onPressed: () {
                      // Add your checkout logic here
                      // For example, you can navigate to a checkout page
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage()));
                    },
                    child: Text('Checkout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}