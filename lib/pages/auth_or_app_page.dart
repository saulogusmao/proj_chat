import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj_chat/core/models/chat_user.dart';
import 'package:proj_chat/core/services/auth/auth_mock_service.dart';
import 'package:proj_chat/core/services/auth/auth_service.dart';
import 'package:proj_chat/pages/auth_page.dart';
import 'package:proj_chat/pages/chat_page.dart';
import 'package:proj_chat/pages/loading_page.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthService().userChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            return snapshot.hasData ? ChatPage() : AuthPage();
          }
        },
      ),
    );
  }
}
