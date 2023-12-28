import 'package:flutter/material.dart';

class cartproducts extends StatefulWidget {

  @override
  State<cartproducts> createState() => _cartproductsState();
}

class _cartproductsState extends State<cartproducts> {
 
  var products_on_cart=[
    {
      "name":"Psychology",
      "picture":"assets/images/M-psy.png",
      "Price":"1000"
    },
    {
      "name":"TheCovenantOfWater",
      "picture":"assets/images/novel1.jpg",
      "Price":"2000"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products_on_cart.length,
      itemBuilder:(context,index){
        return singlecartproduct(
          cart_prod_name: products_on_cart[index]["name"],
          cart_prod_price: products_on_cart[index]["Price"],
          cart_prod_picture: products_on_cart[index]["picture"],
        );

      } );
  }
}
class singlecartproduct extends StatelessWidget {
   final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;

  singlecartproduct({this.cart_prod_name,this.cart_prod_price,this.cart_prod_picture});

  

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(

        leading: Image.asset(cart_prod_picture,width: 80,height: 80,),
        title: Text(cart_prod_name),
        subtitle: Column(
          children: [
            Row(
              children: [
                 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Author:'),
                ),
                 Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("-"),
                ),
                Padding(padding: EdgeInsets.fromLTRB(20, 8, 6, 8),
                child: Text('Condition:'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Used")),
                  Padding(padding: EdgeInsets.fromLTRB(20, 8, 10, 8),
                child: IconButton(
                  icon: Icon(Icons.select_all_rounded),
                  onPressed: (){
                    
                  },
                ),
                ),
               
              ],
            ),
           Container(
            alignment: Alignment.topLeft,
            child: Text("\Rs.${cart_prod_price}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
           ),

          ],
        ),
       
      ),
    );
  }
}