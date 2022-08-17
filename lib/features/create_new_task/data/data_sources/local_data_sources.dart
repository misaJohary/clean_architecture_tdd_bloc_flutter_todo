import '../../../../core/error/exception.dart';
import '../../../../core/services/db.dart';
import '../../../task/data/model/task_model.dart';

abstract class NewTaskLocalDataSources {
  Future<TaskModel> createTask(TaskModel task);
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
}
