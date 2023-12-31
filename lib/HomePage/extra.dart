import 'package:flutter/material.dart';
import 'package:sajhabackup/pages/bookdetails.dart';

class extra extends StatefulWidget {
  const extra({super.key});

  @override
  State<extra> createState() => _extraState();
}

class _extraState extends State<extra> {
  var product_list=[
    {
      "name":"It Ends With Us",
      "picture":"assets/images/novel2.jpg",
      "Price":"2000"
    },
     
    {
      "name":"TheCovenantOfWater",
      "picture":"assets/images/novel1.jpg",
      "Price":"2000"
    },
     {
      "name":"Class 12 English",
      "picture":"assets/images/e1.jpg",
      "Price":"400"
    },
     {
      "name":"Class 12 Nepali",
      "picture":"assets/images/e2.jpg",
      "Price":"350"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext conntext, int index){
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_price: product_list[index]['Price']

        );
      }
    );
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
  }
  
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
      child: Material(
        child: InkWell(
          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>booksdetails(
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
              child:Row(
                    children: [
                      Expanded(child: Text(prod_name,style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      Text('\Rs${prod_price}',style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
            ),
            child:Image.asset(prod_picture,fit: BoxFit.cover,) ,
            
          ),
        )
      ),
      ),
    );
  }
}