import 'dart:math';

import 'package:app/controllers/note.dart';
import 'package:app/models/note.dart';
import 'package:app/pages/editor.dart';
import 'package:app/shared/shared.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  NoteController noteController = NoteController();
  List<Color> colors = [];
  @override
  void initState() {
    super.initState();
    noteController.getNotesData().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notes.length.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => EditorPage(editNote: Note()),
            ),
          ).then((value) {
            print("Welcome Back");
            print(value);

            setState(() {
              notes.add(value);
              noteController.setNotesInStorage(value, notes.length - 1);
              noteController.setNotesLength(notes.length);
            });
          });
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
                        noteController.setNotesInStorage(notes[index], index);
                      });
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: randomColor(),
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

  Color randomColor() {
    Random random = Random();

    return Color.fromARGB(
      255,
      random.nextInt(256), // 0 - 255
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}

//root
