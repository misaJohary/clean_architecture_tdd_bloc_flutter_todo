import '../../../../core/error/exception.dart';
import '../../../../core/services/db.dart';
import '../../domain/entity/task_entity.dart';
import '../model/task_model.dart';

abstract class TaskLocalDataSources {
  Future<List<TaskModel>> findTasks();
  Future<TaskModel> createTask(TaskModel task);
  Future<TaskEntity> updateTask(TaskEntity task);
  Future<TaskEntity> deleteTask(TaskEntity task);
}

class TaskLocalDataSourcesImp implements TaskLocalDataSources {
  final DbService db;

  TaskLocalDataSourcesImp({required this.db});
  @override
  Future<List<TaskModel>> findTasks() async {
    try {
      final result = await db.allItems();
      return List<TaskModel>.from(
        result.map(
          (item) => TaskModel.fromJson(item),
        ),
      );
    } catch (_) {
      print(_);
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

  @override
  Future<TaskEntity> updateTask(TaskEntity task) async {
    final TaskModel taskModel = TaskModel(
      id: task.id,
      name: task.name,
      description: task.description,
      date: task.date,
      isDone: task.isDone,
    );
    if ((await db.updateItem(taskModel)) == 0) {
      throw CacheException();
    }
    return task;
  }

  @override
  Future<TaskEntity> deleteTask(TaskEntity task) async {
    if (await db.deleteItem(task.id!) == 0) {
      throw CacheException();
    }
    return task;
  }
}
