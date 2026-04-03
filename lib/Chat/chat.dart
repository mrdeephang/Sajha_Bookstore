import 'package:flutter/material.dart';
import 'package:sajha_bookstore/Chat/chat_service.dart';
import 'package:sajha_bookstore/Chat/chatpage.dart';
import 'package:sajha_bookstore/EasyConst/colors.dart';
import 'package:sajha_bookstore/EasyConst/styles.dart';
import 'package:sajha_bookstore/Widgets/user_tile.dart';
import 'package:sajha_bookstore/services/auth_service_impl.dart';

class Chat extends StatelessWidget {
  final AuthService _authService = AuthService();
  final ChatService _chatService = ChatService();

  Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          'Chat',
          style: TextStyle(fontSize: 20, fontFamily: bold, color: color1),
        ),
        leading: BackButton(color: color1),
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    if (userData['Email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["Email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["Email"],
                receiverID: userData['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
