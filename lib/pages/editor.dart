import 'package:app/models/note.dart';
import 'package:flutter/material.dart';

class EditorPage extends StatefulWidget {
  final Note editNote;
  const EditorPage({required this.editNote, super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.editNote.title != null) {
      setState(() {
        title.text = widget.editNote.title!;
        body.text = widget.editNote.body!;
      });
    }
  }

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
              if (title.text.isNotEmpty && body.text.isNotEmpty) {
                Note note = Note(body: body.text, title: title.text);
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
              controller: title,
              onChanged: (value) {
                print(value);
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
              controller: body,
              maxLines: 10,
              onChanged: (value) {
                print(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
