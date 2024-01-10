import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sajhabackup/pages/bookdetails2.dart';

class BookListPage extends StatefulWidget {
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(),
        title: Text('Recently Added'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('books').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var books = snapshot.data!.docs;

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              var book = books[index].data() as Map<String, dynamic>;

              return ListTile(
                title: Text(book['name']),
                subtitle: Text('Author: ${book['author']}\nPrice: \Rs${book['price']}'),
                leading: Image.network(
                  book['image_url'],
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>booksdetails2(
                  book: book,
                  )));
                },
              );
            },
          );
        },
      ),
    );
  }
}