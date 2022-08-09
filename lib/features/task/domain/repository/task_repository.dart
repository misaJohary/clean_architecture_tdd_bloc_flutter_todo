import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> findTasks();
}
