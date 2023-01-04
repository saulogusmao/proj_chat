import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj_chat/core/models/chat_user.dart';
import 'package:proj_chat/core/services/auth/auth_mock_service.dart';
import 'package:proj_chat/core/services/auth/auth_service.dart';
import 'package:proj_chat/pages/auth_page.dart';
import 'package:proj_chat/pages/chat_page.dart';
import 'package:proj_chat/pages/loading_page.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: init(context),
        builder: ((ctx, snapshot) {
          return StreamBuilder<ChatUser?>(
            stream: AuthService().userChanges,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingPage();
              } else {
                return snapshot.hasData ? ChatPage() : AuthPage();
              }
            },
          );
        }));
  }
}
