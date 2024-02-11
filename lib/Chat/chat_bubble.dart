import 'package:flutter/material.dart';

class chatbubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const chatbubble({super.key,required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isCurrentUser? Colors.green: Colors.blue,
      ),
      child: Text(message,style: TextStyle(fontSize: 16,color: Colors.white),),
    );
  }
}