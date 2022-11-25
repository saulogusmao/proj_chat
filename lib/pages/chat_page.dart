import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj_chat/core/services/auth/auth_mock_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chat page'),
            TextButton(
              onPressed: () {
                AuthMockService().logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
