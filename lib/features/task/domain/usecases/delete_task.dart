import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/task_entity.dart';
import '../repository/task_repository.dart';

class DeleteTask extends Usecase<TaskEntity, DeleteTaskParam> {
  final TaskRepository _repo;

  DeleteTask(this._repo);
  @override
  Future<Either<Failure, TaskEntity>> call(DeleteTaskParam params) async {
    return await _repo.deleteTask(params.task);
  }
}

class DeleteTaskParam {
  final TaskEntity task;
  const DeleteTaskParam(this.task);
}
