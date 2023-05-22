import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMe, this.userName, {super.key});

  // ignore: prefer_typing_uninitialized_variables
  final message, isMe, userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
            padding: isMe
                ? const EdgeInsets.only(right: 5)
                : const EdgeInsets.only(left: 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (!isMe) ...[
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(userName,
                      style: const TextStyle(color: Colors.grey)),
                ),
              ],
              Container(
                decoration: BoxDecoration(
                  color: isMe ? Colors.lightGreen : Colors.black12,
                  borderRadius: isMe
                      ? const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )
                      : const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                ),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  message,
                  style: TextStyle(color: isMe ? Colors.white : Colors.black),
                ),
              )
            ]))
      ],
    );
  }
}
