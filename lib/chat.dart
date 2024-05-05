import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Message {
  String message;
  bool fromMe;
  Message(this.message, this.fromMe);
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool showData = false;

  List<Message> messages = [];
  TextEditingController messageCon = TextEditingController();

  var streamData = StreamController.broadcast();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<dynamic> getFromStorage() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return "Hello";
  }

  Future setFromStorage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("key", "Future 5");
  }

  Stream<int> getNumbers() async* {
    for (var i = 0; i < 20; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  void sendMessage() {
    Timer(Duration(seconds: 1), () {
      messages.add(Message(messageCon.text.toString(), true));
      messageCon.text = "";
      streamData.sink.add("event");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat App"),
        actions: const [
          /*  IconButton(
            onPressed: () async {
              await setFromStorage();
              showData = true;
              setState(() {});
            },
            icon: const Icon(Icons.get_app),
          ),
          IconButton(
            onPressed: () async {
              Map dd = {"key":"value"};
              streamData.sink.add(dd);
            },
            icon: const Icon(Icons.abc_outlined),
          ), */
        ],
      ),
      /*     body: !showData
          ? Container()
          : FutureBuilder(
              future: getFromStorage(),
              builder: (BuildContext context, snapshot) {
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.data == null) {
                  return const Text("No Data");
                }
                return Text(snapshot.data.toString());
              },
            ), */

      /* body: StreamBuilder<int>(
        stream: getNumbers(),
        builder: (BuildContext context, snapshot) {
          return Text(snapshot.data.toString());
        },
      ), */

      body: ListView(
        reverse: true,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: messageCon,
              decoration: InputDecoration(border: OutlineInputBorder()),
              onSubmitted: (value) {
                sendMessage();
              },
            ),
          ),
          StreamBuilder(
            stream: streamData.stream,
            builder: (BuildContext context, snapshot) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return chatBubble(messages[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget chatBubble(Message message) {
    return Container(
      alignment: message.fromMe ? Alignment.centerRight : Alignment.bottomLeft,
      child: Text(
        message.message,
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
