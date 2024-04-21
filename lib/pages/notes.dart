import 'dart:math';

import 'package:app/controllers/note.dart';
import 'package:app/models/note.dart';
import 'package:app/pages/editor.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> notes = [];
  NoteController noteController = NoteController();
  List<Color> colors = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*  List<Note> allNotes = noteController.getNotes();
    for (var i = 0; i < allNotes.length; i++) {
      print(allNotes[i].body);
    } */
  }

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
              builder: (BuildContext context) => EditorPage(editNote: Note()),
            ),
          ).then((value) {
            print("Welcome Back");
            print(value);

            setState(() {
              notes.add(value);
            });
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
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EditorPage(
                          editNote: notes[index],
                        ),
                      ),
                    ).then((value) {
                      setState(() {
                        notes[index] = value;
                      });
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colors[index],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "${notes[index].title}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${notes[index].body}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

//root
