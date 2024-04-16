import 'package:flutter/material.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  String title = '';
  String body = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editor"),
        actions: [
          IconButton(
            onPressed: () {
              print(title);
              print(body);
              if (title.isNotEmpty && body.isNotEmpty) {
                Map note = {'title': title, 'body': body};
                Navigator.pop(context, note);
              } else {
                print("Pls Fill Dtata");
              }
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
              ),
              onChanged: (value) {
                print(value);
                title = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Body",
              ),
              maxLines: 10,
              onChanged: (value) {
                print(value);
                body = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
