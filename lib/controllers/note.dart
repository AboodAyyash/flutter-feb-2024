import 'package:app/models/note.dart';
import 'package:app/shared/shared.dart' as sharedFile;

class NoteController {
  List<Note> getNotes() {
    return sharedFile.dummyNotes;
  }
}
