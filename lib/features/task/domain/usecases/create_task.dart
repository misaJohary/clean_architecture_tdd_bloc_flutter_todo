import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/model/task_model.dart';
import '../entity/task_entity.dart';
import '../repository/task_repository.dart';

class CreateTaskUseCase implements Usecase<TaskEntity, AddTaskParam> {
  final TaskRepository _repository;

  const CreateTaskUseCase(this._repository);
  @override
  Future<Either<Failure, TaskEntity>> call(AddTaskParam params) async {
    return await _repository.createTask(params.task);
  }
}

class AddTaskParam {
  final TaskModel task;
  const AddTaskParam(this.task);
}
