import 'package:app/editor.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () /* async */ {
          /*  var result = await */ Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const EditorPage(),
            ),
          ).then((value) {
            print("Welcome Back");
            print(value);
          });

          /*   print(result); */
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: notes.isEmpty
          ? Center(
              child: Image.asset(
                "assets/images/image1.jpeg",
              ),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  child: Text("$index"),
                );
              },
            ),
    );
  }
}
