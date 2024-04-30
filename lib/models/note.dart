class Note {
  //int? id;
  String? title;
  String? body;

  Note({/* this.id, */ this.body, this.title});

  Map<String, dynamic> toMap() {
    return {
      //  'id': id,
      'title': title,
      'body': body,
    };
  }
}
