import 'dart:io';

import 'package:app/models/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  String dbName = "notes.db";
  int dbVersion = 1;
  String tableName = 'notes';

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + dbName;
    return openDatabase(path, version: dbVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE $tableName (

  title TEXT NOT NULL,
  body TEXT NOT NULL
)
''');
//  id INTEGER PRIMARY KEY,
  }

  Future insertNote(Note note) async {
    Database? database = await initDatabase();
    return await database.insert(tableName, note.toMap());
  }

  Future<List<Note>> queryAllNotes() async {
    Database? database = await initDatabase();
    List<Map<String, dynamic>> maps = await database.query(tableName);
    /*  List<Note> allNotes = [];
    for (var i = 0; i < maps.length; i++) {
      allNotes.add(Note(body: maps[i]['body'], title: maps[i]['title']));
    }
    return allNotes; */

    return List.generate(maps.length, (index) {
      return Note(
        body: maps[index]['body'],
        title: maps[index]['title'],
        // id: maps[index]['id'],
      );
    });
  }

  Future updateNote(Note note) async {
    Database? database = await initDatabase();
    return await database.update(
      tableName,
      note.toMap(),
      where: 'title = ?',
      whereArgs: [note.title],
      /*    where: 'id = ?',
      whereArgs: [note.id], */
    );
  }

  Future deleteNote(Note note) async {
    Database? database = await initDatabase();
    return database.delete(
      tableName,
      where: 'title = ?',
      whereArgs: [note.title],
    );
  }
}
