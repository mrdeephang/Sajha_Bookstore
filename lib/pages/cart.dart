import 'package:flutter/material.dart';
import 'package:sajhabackup/cart_products.dart';
class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Cart'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white,)),
           //IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.white,))
        ],
       ),
       body: cartproducts(),
       bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(child: ListTile(
              title: Text('Total:'),
              subtitle: Text('Rs'),

            )),
            Expanded(
              child: MaterialButton(onPressed: (){},
              child: Text('Check Out',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              color: Colors.deepPurple,
              ),
            )
          ],
        ),
       ),

    );
  }
}