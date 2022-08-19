import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../task/data/model/task_model.dart';
import '../../../task/domain/entity/task_entity.dart';

abstract class NewTaskRepository {
  Future<Either<Failure, TaskEntity>> createTask(TaskModel task);
  Future<Either<Failure, TaskEntity>> updateTask(TaskEntity task);
}
