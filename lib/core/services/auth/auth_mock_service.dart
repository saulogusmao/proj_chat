import 'dart:async';
import 'dart:io';

import 'package:proj_chat/core/models/chat_user.dart';
import 'package:proj_chat/core/models/chat_user.dart';
import 'package:proj_chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(null);
  });

  ChatUser? get currentUser {
    return null;
  }

  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  Future<void> signup(
      String nome, String email, String password, File image) async {}
  Future<void> login(String email, String password) async {}
  Future<void> logout() async {}

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
