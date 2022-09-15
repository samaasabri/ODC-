import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class SQLHelper {

  static Future<Database> initDb() async {
    return sql.openDatabase(
      'odc.db', //database name
      version: 1, //version number
      onCreate: (Database database, int version) async {
        await createNotes(database);
      },
    );
  }

  static Future<void> createNotes(Database database) async {
    await database.execute("""CREATE TABLE Notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        note TEXT,
        date Text
      )
      """);

    debugPrint("table Created");
  }

  //add
  static Future<int> addNotes(String title, String note,String date) async {
    final db = await SQLHelper.initDb(); //open database
    final data = {'title': title, 'note': note,'date':date}; //create data in map
    final id = await db.insert('Notes', data);  //insert
    debugPrint("Data Added");
    return id;
  }

//read all plants
  static Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await SQLHelper.initDb();
    return db.query('Notes', orderBy: "id");
  }

  //get plant by id
  static Future<List<Map<String, dynamic>>> getNote(int id) async {
    final db = await SQLHelper.initDb();
    return db.query('Notes', where: "id = ?", whereArgs: [id]);
  }

  //update
  static Future<int> updateNotes(
      int id, String title, String? note) async {
    final db = await SQLHelper.initDb();
    final data = {
      'title': title,
      'note': note,
    };

    final result =
        await db.update('Notes', data, where: "id = ?", whereArgs: [id]);
    return result;
  }
  // Delete
  static Future<void> deleteNotes(int id) async {
    final db = await SQLHelper.initDb();
    try {
      await db.delete("Notes", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when : $err");
    }
  }

  static Future<void> deleteAllNotes ()async{
    final db = await SQLHelper.initDb();
    try {
      await db.delete("Notes");
    } catch (err) {
      print("Something went wrong when : $err");
    }
}
}
