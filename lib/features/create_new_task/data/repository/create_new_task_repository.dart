import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../task/data/model/task_model.dart';
import '../../../task/domain/entity/task_entity.dart';
import '../../domain/reporitory/new_task_repository.dart';
import '../data_sources/local_data_sources.dart';

class NewTaskRepositoryImp implements NewTaskRepository {
  final NewTaskLocalDataSources _taskLocalDataSource;

  const NewTaskRepositoryImp(this._taskLocalDataSource);

  @override
  Future<Either<Failure, TaskEntity>> createTask(TaskModel task) async {
    try {
      return Right(await _taskLocalDataSource.createTask(task));
    } catch (_) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> updateTask(TaskEntity task) async {
    try {
      return Right(await _taskLocalDataSource.updateTask(task));
    } catch (_) {
      print(_);
      return const Left(CacheFailure());
    }
  }
}
