import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intweet_aplikation/components/top_bar.dart';

class ChatMessage {
  final String senderName;
  final String message;
  final String time;

  ChatMessage(
      {required this.senderName, required this.message, required this.time});
}

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatMessage> _messages = [
    ChatMessage(senderName: 'iohn Doe', message: 'Hi there!', time: '11:00 AM'),
    ChatMessage(senderName: 'Jane Smith', message: 'Hello!', time: '11:05 AM'),
    ChatMessage(
        senderName: 'John Doe', message: 'How are you?', time: '11:10 AM'),
    ChatMessage(
        senderName: 'Jane Smith',
        message: 'I am fine. How about you?',
        time: '11:15 AM'),
    ChatMessage(
        senderName: 'John Doe',
        message: 'I am good. Thanks!',
        time: '11:20 AM'),
  ];

  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C3333),
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          ),
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color(0xff2C3333),
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          ClipOval(
              child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/user_placeholder.png',
            image:
                'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*',
            fit: BoxFit.fill,
            width: 40,
            height: 40,
          )),
          const Padding(padding: EdgeInsets.only(right: 8)),
          const Text("User324")
        ]),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: _messages[index].senderName == 'John Doe'
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment:
                            _messages[index].senderName == 'John Doe'
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(_messages[index].senderName),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _messages[index].senderName == 'John Doe'
                                  ? Colors.grey[200]
                                  : Colors.blue[200],
                            ),
                            child: Text(_messages[index].message),
                          ),
                          Text(_messages[index].time),
                        ],
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    setState(() {
                      _messages.add(ChatMessage(
                          senderName: 'Jane Smith',
                          message: _textEditingController.text,
                          time: "11:00 AM"));
                      _textEditingController.clear();
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
