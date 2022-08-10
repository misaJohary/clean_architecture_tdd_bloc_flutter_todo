import '../../../../core/error/exception.dart';
import '../../../../core/services/db.dart';
import '../model/task_model.dart';

abstract class TaskLocalDataSources {
  Future<List<TaskModel>> findTasks();
  Future<TaskModel> createTask(TaskModel task);
}

class TaskLocalDataSourcesImp implements TaskLocalDataSources {
  final DbService db;

  TaskLocalDataSourcesImp({required this.db});
  @override
  Future<List<TaskModel>> findTasks() async {
    try {
      return await db.allItems();
    } catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<TaskModel> createTask(TaskModel task) async {
    if ((await db.createItem(task)) == 0) {
      throw CacheException();
    }
    return task;
  }
}
