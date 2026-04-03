import 'package:flutter/material.dart';
import 'package:sajha_bookstore/Cart/cart_products.dart';
import 'package:sajha_bookstore/EasyConst/colors.dart';
import 'package:sajha_bookstore/pages/search.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: color,
        title: Text(
          'Favorites',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: color1),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Search()),
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
          //IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.white,))
        ],
      ),
      body: cartproducts(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: ListTile(
              title: Text('Total:'),
              subtitle: Text('Rs'),
            )),
           
          ],
        ),
      ),
    );
  }
}
