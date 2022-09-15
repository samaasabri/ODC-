class NoteModel {
  String? title;
  String? note;
  String? date;

  NoteModel();

  NoteModel.fromDb(Map<String,dynamic> mp)
  {
    date=mp['date'];
    note=mp['note'];
    title=mp['title'];

  }

}
