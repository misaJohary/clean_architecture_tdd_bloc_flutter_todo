import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entity/task_entity.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/task_repository.dart';
import '../data_sources/local_data_sources.dart';
import '../model/task_model.dart';

class TaskRepositoryImp implements TaskRepository {
  final TaskLocalDataSources _taskLocalDataSource;

  const TaskRepositoryImp(this._taskLocalDataSource);

  @override
  Future<Either<Failure, List<TaskEntity>>> findTasks() async {
    try {
      return Right(await _taskLocalDataSource.findTasks());
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

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
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> deleteTask(TaskEntity task) async {
    try {
      return Right(await _taskLocalDataSource.deleteTask(task));
    } catch (_) {
      return const Left(CacheFailure());
    }
  }
}
