import 'package:becky_app/components/chat_bubble.dart';
import 'package:becky_app/models/message_modal.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<MessageModal> messages = [];
  final promptCon = TextEditingController();

  void sendMessage() {
    final msg = promptCon.text;
    setState(() {
      promptCon.clear();
      messages.add(
          MessageModal(isPrompt: true, message: msg, time: DateTime.now()));
    });

    //response message
    setState(() {
      messages.add(MessageModal(
          isPrompt: false,
          message: "Hellow I am your personal medical assistant",
          time: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ChatBubble(
                          isPrompt: messages[index].isPrompt,
                          message: messages[index].message,
                          time: "time"
                          // DateFormat("hh:mm a").format(messages[index].time),
                          ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    flex: 20,
                    child: TextField(
                        controller: promptCon,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 53, 52, 52)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          fillColor: Colors.grey[700],
                          filled: true,
                          hintText: "Muulize wakili",
                        ))),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    sendMessage();
                    print(messages.length);
                  },
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.lightBlue,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
