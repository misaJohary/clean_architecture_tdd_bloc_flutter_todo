import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/task_entity.dart';
import '../repository/task_repository.dart';

class FindTasks implements Usecase<List<TaskEntity>, NoParams> {
  const FindTasks(this.taskRepository);
  final TaskRepository taskRepository;

  @override
  Future<Either<Failure, List<TaskEntity>>> call(NoParams params) {
    return taskRepository.findTasks();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
