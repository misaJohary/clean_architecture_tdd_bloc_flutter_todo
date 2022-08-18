import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../task/data/model/task_model.dart';
import '../../../task/domain/entity/task_entity.dart';
import '../reporitory/new_task_repository.dart';

class CreateTaskUseCase implements Usecase<TaskEntity, AddTaskParam> {
  final NewTaskRepository _repository;

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
