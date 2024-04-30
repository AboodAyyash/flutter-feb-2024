import 'dart:math';

import 'package:app/DB/helper.dart';
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

  DBHelper dbHelper = DBHelper();
  @override
  void initState() {
    super.initState();
    dbHelper.queryAllNotes().then((value) {
      print(value);
      for (var i = 0; i < value.length; i++) {
        print(i);
        print(value[i].title);
        print(value[i].body);
      }
      notes.addAll(value);
      setState(() {});
    });
    /*  noteController.getNotesData().then((value) {
      setState(() {});
    }); */
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
              dbHelper.insertNote(value).then((value) {
                print(value);
              });
              //   noteController.setNotesInStorage(value, notes.length - 1);
              //    noteController.setNotesLength(notes.length);
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
                        dbHelper.updateNote(value);
                        //noteController.setNotesInStorage(notes[index], index);
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
                        Stack(
                          children: [
                          /*   Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text("sss"),
                            ), */
                            TextButton(
                              onLongPress: () {
                              //  print("LONG");
                              },
                              onPressed: () {
                                dbHelper.deleteNote(notes[index]);
                                notes.removeAt(index);
                                setState(() {});
                              },
                              child: Text("Delete"),
                            ),
                          ],
                        )
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
