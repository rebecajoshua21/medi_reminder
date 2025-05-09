import 'package:becky_app/components/chat_bubble.dart';
import 'package:becky_app/models/message_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<MessageModal> messages = [];
  final promptCon = TextEditingController();

  void sendMessage() {
    Gemini.instance.prompt(parts: [
      Part.text(
          "${promptCon.text} reply as doctor Becky who is here to help with simple medical questions and advice"),
    ]).then((value) {
      // print(value?.output);
      setState(() {
        messages.add(MessageModal(
            isPrompt: false,
            message: value?.output ?? "hello",
            time: DateTime.now()));
      });
    }).catchError((e) {
      print('error ${e}');
    });
    final msg = promptCon.text;
    setState(() {
      promptCon.clear();
      messages.add(
          MessageModal(isPrompt: true, message: msg, time: DateTime.now()));
    });

    //response message
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
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          fillColor: const Color.fromARGB(255, 166, 202, 255),
                          filled: true,
                          hintText: "Muulize dokta Becky",
                        ))),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    sendMessage();
                    // print(messages.length);
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
