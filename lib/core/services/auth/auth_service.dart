import 'dart:io';

import 'package:proj_chat/core/models/chat_user.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;

  Future<void> signup(
    String nome,
    String email,
    String password,
    File image,
  );
  Future<void> login(
    String email,
    String password,
  );
  Future<void> logout();
}
