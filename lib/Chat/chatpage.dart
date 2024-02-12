import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sajhabackup/Chat/chat_bubble.dart';
import 'package:sajhabackup/Chat/chat_service.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/EasyConst/Styles.dart';
import 'package:sajhabackup/services/AuthService.dart';

class chatpage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  chatpage({super.key, required this.receiverEmail, required this.receiverID});

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          receiverEmail,
          style: TextStyle(fontSize: 20, fontFamily: bold, color: color1),
        ),
        leading: BackButton(color: color1),
      ),
      body: Column(
        children: [Expanded(child: _buildMessageList()), _buildUserInput()],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderId = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessage(receiverID, senderId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    var alignment=(data['senderId']==_firebaseAuth.currentUser!.uid)
    ? Alignment.centerRight
    : Alignment.centerLeft;
    return Padding(
      padding: const EdgeInsets.only(left:10.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child:Align(
          alignment: alignment, 
          child: chatbubble(message: data['message']))),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 5),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _messageController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Message...',
              hintStyle: TextStyle(
                  color: Colors.grey, fontFamily: regular, fontSize: 14),
              fillColor: color1,
              filled: true,
            ),
          )),
          SizedBox(
            width: 5,
          ),
          Container(
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: sendMessage,
                  icon: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
