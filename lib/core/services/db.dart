import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/task/data/model/task_model.dart';

abstract class DbService {
  Future<int?> createItem(TaskModel task);
  Future<int> updateItem(TaskModel task);
  Future allItems();
  Future<int> deleteItem(int id);
}

class DbServiceImp implements DbService {
  Database? _db;

  Future<Database> createDB() async {
    if (_db != null) {
      return _db!;
    }

    String path = join(await getDatabasesPath(), 'task_collection.db');
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            dateTime TEXT,
            views INTEGER,
            isDone INTEGER
          );
        ''').catchError((val) => log(val));
    });
    return _db!;
  }

  @override
  Future allItems() async {
    Database db = await createDB();
    return db.query('tasks');
  }

  @override
  Future<int?> createItem(TaskModel task) async {
    Database db = await createDB();
    return db.insert('tasks', task.toJson());
  }

  @override
  Future<int> deleteItem(int id) async {
    Database db = await createDB();
    return db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> updateItem(TaskModel task) async {
    Database db = await createDB();
    return db
        .update('tasks', task.toJson(), where: 'id = ?', whereArgs: [task.id]);
  }
}
