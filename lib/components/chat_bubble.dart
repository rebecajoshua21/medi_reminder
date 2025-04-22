import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isPrompt;
  final String message;
  final String time;
  const ChatBubble(
      {Key? key,
      required this.isPrompt,
      required this.message,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 0)
          .copyWith(left: isPrompt ? 80 : 0, right: isPrompt ? 0 : 80),
      decoration: BoxDecoration(
          color: isPrompt ? Colors.blue : Colors.lightBlueAccent,
          borderRadius: BorderRadius.only(
              topLeft: isPrompt ? Radius.circular(20) : Radius.circular(0),
              topRight: isPrompt ? Radius.circular(0) : Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                textAlign: TextAlign.end,
                time,
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
            )
          ],
        ),
      ),
    );
  }
}
