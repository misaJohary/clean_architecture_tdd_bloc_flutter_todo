import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/task_entity.dart';
import '../repository/task_repository.dart';

class UpdateTaskUsecase implements Usecase<TaskEntity, UpdateTaskParam> {
  final TaskRepository _repository;

  const UpdateTaskUsecase(this._repository);

  @override
  Future<Either<Failure, TaskEntity>> call(params) async {
    return await _repository.updateTask(params.task);
  }
}

class UpdateTaskParam {
  final TaskEntity task;

  const UpdateTaskParam(this.task);
}
