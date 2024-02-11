
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sajhabackup/Chat/chat_bubble.dart';
import 'package:sajhabackup/Chat/chat_service.dart';
import 'package:sajhabackup/services/AuthService.dart';

class chatpage extends StatelessWidget {
  final String receiverEmail;
    final String receiverID;

 chatpage({super.key,required this.receiverEmail,required this.receiverID});

final TextEditingController _messageController=TextEditingController();
final ChatService _chatService=ChatService();
  final AuthService _authService = AuthService();
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

void sendMessage()async{
  if(_messageController.text.isNotEmpty){
    await _chatService.sendMessage(receiverID, _messageController.text);
    _messageController.clear();
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildUserInput()
        ],
      ),
    );
  }
  Widget _buildMessageList(){
    String senderId=_authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessage(receiverID, senderId),
       builder: (context,snapshot){
        if(snapshot.hasError){
          return Text('Error');
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Text('Loading...');
        }
        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
       });
  }
  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String,dynamic> data=doc.data() as Map<String,dynamic>;
    bool isCurrentUser=data['senderID']==_firebaseAuth.currentUser!.uid;
    var alignment=isCurrentUser? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: 
          
          chatbubble(message: data['message'])
        
      );
  }
  Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom:50.0),
      child: Row(
        children: [
          Expanded(child: TextField(
            decoration: InputDecoration(
              hintText: 'Type Something...'
            ),
            controller: _messageController,
          )),
          Container(
            margin: EdgeInsets.only(right: 25),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle
            ),
            child: IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward,color: Colors.white,)))
        ],
      ),
    );
  }
}