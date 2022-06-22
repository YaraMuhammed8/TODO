import 'package:sqflite/sqflite.dart';

import '../../Models/task.dart';

class SQLiteHelper {
  static late Database database;
  static Future<void> createDB() async {
    database = await openDatabase(
      "todo.db",
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT);");
      },
      onOpen: (db) {
        database = db;
      },
    );
  }

  static Future<List<Map>> getDataFromDB() async {
    return await database.rawQuery("SELECT * from tasks");
  }

  static Future<void> insertRaw(Task task) async {
    await database.transaction((txn) async {
      database.rawInsert(
          'INSERT INTO tasks (title,time,date,status) VALUES("${task.name}","${task.time}","${task.date}","new");');
    });
  }

  static Future<void> deleteRaw(int id) async {
    await database.transaction((txn) async {
      database.rawDelete('DELETE FROM tasks WHERE id = $id');
    });
  }
}