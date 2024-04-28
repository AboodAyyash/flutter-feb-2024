import 'package:app/models/note.dart';
import 'package:app/shared/shared.dart' as sharedFile;
import 'package:shared_preferences/shared_preferences.dart';

class NoteController {
  List<Note> getNotes() {
    return sharedFile.dummyNotes;
  }

  setNotesInStorage(Note note, index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        "title$index", note.title.toString()); //title0 \ title1 \ title 2
    sharedPreferences.setString(
        "body$index", note.body.toString()); //body0 \ body1 \ body2
  }

  Future<Note> getNotesFromStorage(index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return Note(
      body: sharedPreferences.getString("body$index"),//title0
      title: sharedPreferences.getString("title$index"),//body0 
    );
  }

  setNotesLength(length) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("notesLength", length);
  }

  Future getNotesData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int length = 0;
    if (sharedPreferences.getInt("notesLength") != null) {
      length = sharedPreferences.getInt("notesLength")!;
    }
    for (var i = 0; i < length; i++) {
      await getNotesFromStorage(i).then((value) {
        sharedFile.notes.add(value);
      });
    }
  }
}

//

// 5 notes 


//column1 column2
//title1  body1  => Note
//title2  body2  => Note
//title2  body2  => Note
//title2  body2  => Note
