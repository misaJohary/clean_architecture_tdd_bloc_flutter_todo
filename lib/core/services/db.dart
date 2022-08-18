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

    final String path = join(await getDatabasesPath(), 'my_tasks_now.db');
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      db.execute('''
          CREATE TABLE m_tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,
            date TEXT,
            isDone INTEGER
          );
        ''').catchError((val) => log(val));
    });
    return _db!;
  }

  @override
  Future allItems() async {
    final Database db = await createDB();
    return db.query('m_tasks');
  }

  @override
  Future<int?> createItem(TaskModel task) async {
    final Database db = await createDB();
    return db.insert('m_tasks', task.toJson());
  }

  @override
  Future<int> deleteItem(int id) async {
    final Database db = await createDB();
    return db.delete('m_tasks', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> updateItem(TaskModel task) async {
    final Database db = await createDB();
    return db.update('m_tasks', task.toJson(),
        where: 'id = ?', whereArgs: [task.id]);
  }
}
