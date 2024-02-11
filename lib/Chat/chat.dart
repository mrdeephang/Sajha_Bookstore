import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sajhabackup/Chat/chat_service.dart';
import 'package:sajhabackup/Chat/chatpage.dart';
import 'package:sajhabackup/Widgets/user_tile.dart';
import 'package:sajhabackup/services/AuthService.dart';

class chat extends StatelessWidget {
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  final AuthService _authService=AuthService();
  final ChatService _chatService=ChatService();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHAT'),
      ),
      body: _buildUserList(),
    );
  }
  Widget _buildUserList(){
    return StreamBuilder(stream: _chatService.getUsersStream(),
     builder: (context,snapshot){
      if(snapshot.hasError){
        return Text('Error');
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        return Text('Loading...');
      }
      return ListView(
        children: snapshot.data!.map<Widget>((userData)=>_buildUserListItem(userData,context)).toList(),
      );
     }
     );
  }
  Widget _buildUserListItem(Map<String,dynamic>userData, BuildContext context){
    if(
      userData['Email']!=_authService.getCurrentUser()!.email
    ){
      
      return UserTile(
      text: userData["Email"],
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>chatpage(
          receiverEmail: userData["Email"],
          receiverID: userData['uid'],
        )));
      },
    );
    }else{
      return Container();
    }
  }
}