import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/task_model.dart';
import '../entity/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> findTasks();
  Future<Either<Failure, TaskEntity>> createTask(TaskModel task);
  Future<Either<Failure, TaskEntity>> deleteTask(TaskEntity task);
}
