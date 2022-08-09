import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entity/task_entity.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/task_repository.dart';
import '../data_sources/local_data_sources.dart';

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
}