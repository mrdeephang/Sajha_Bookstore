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
    required this.price
  });
}
class CartModel extends ChangeNotifier {
  List<Book> cartItems = [];

  void addToCart(Book book) {
    cartItems.add(book);
    notifyListeners();
  }
  void removeFromCart(Book book) {
    cartItems.remove(book);
    notifyListeners();
  }
}
