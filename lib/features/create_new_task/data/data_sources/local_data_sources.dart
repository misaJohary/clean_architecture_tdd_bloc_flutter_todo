import '../../../../core/error/exception.dart';
import '../../../../core/services/db.dart';
import '../../../task/data/model/task_model.dart';
import '../../../task/domain/entity/task_entity.dart';

abstract class NewTaskLocalDataSources {
  Future<TaskModel> createTask(TaskModel task);
  Future<TaskEntity> updateTask(TaskEntity task);
}

class NewTaskLocalDataSourcesImp implements NewTaskLocalDataSources {
  final DbService db;

  NewTaskLocalDataSourcesImp({required this.db});

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
}
