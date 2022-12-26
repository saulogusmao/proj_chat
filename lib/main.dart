import 'package:flutter/material.dart';
import 'package:proj_chat/core/services/notification/push_notification_service.dart';
import 'package:proj_chat/pages/auth_or_app_page.dart';
import 'package:proj_chat/pages/auth_page.dart';
import 'package:proj_chat/pages/loading_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PushNotificationService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthOrAppPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
