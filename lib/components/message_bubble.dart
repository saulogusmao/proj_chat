import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj_chat/core/models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongsToCurrentUser;

  const MessageBubble({
    super.key,
    required this.message,
    required this.belongsToCurrentUser,
  });

  Widget _showUserImage(String imageURL) {
    return CircleAvatar(
      backgroundColor: Colors.pink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: belongsToCurrentUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color:
                    belongsToCurrentUser ? Colors.grey.shade300 : Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: belongsToCurrentUser
                      ? Radius.circular(12)
                      : Radius.circular(0),
                  bottomRight: belongsToCurrentUser
                      ? Radius.circular(0)
                      : Radius.circular(12),
                ),
              ),
              width: 180,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 8,
              ),
              child: Column(
                children: [
                  Text(
                    message.userName,
                    style: TextStyle(
                      color: belongsToCurrentUser ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    message.text,
                    style: TextStyle(
                      color: belongsToCurrentUser ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: belongsToCurrentUser ? null : 165,
          right: belongsToCurrentUser ? 165 : null,
          child: _showUserImage(message.userImageURL),
        ),
      ],
    );
  }
}
