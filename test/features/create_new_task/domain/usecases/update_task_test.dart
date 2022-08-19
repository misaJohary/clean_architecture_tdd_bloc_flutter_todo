import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/failure.dart';
import 'package:my_todo_clean/features/create_new_task/domain/reporitory/new_task_repository.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';
import 'package:my_todo_clean/features/task/domain/repository/task_repository.dart';
import 'package:my_todo_clean/features/create_new_task/domain/usecases/update_task.dart';

import 'create_task_usecase_test.mocks.dart';

@GenerateMocks([NewTaskRepository])
void main() {
  late MockNewTaskRepository mockTaskRepository;
  late UpdateTaskUsecase updateTask;

  const TaskEntity tTask = TaskEntity(
    id: 0,
    name: 'test',
    description: 'another test',
    date: '',
    isDone: false,
  );

  setUp(() {
    mockTaskRepository = MockNewTaskRepository();
    updateTask = UpdateTaskUsecase(mockTaskRepository);
  });

  test(
    'Should return taskEntity',
    () async {
      //arrange
      when(mockTaskRepository.updateTask(tTask))
          .thenAnswer((_) async => const Right(tTask));

      //act
      final res = await updateTask(const UpdateTaskParam(tTask));

      //assert
      expect(res, const Right(tTask));
    },
  );

  test(
    'Should return. cache failure',
    () async {
      //arrange
      when(mockTaskRepository.updateTask(tTask))
          .thenAnswer((_) async => const Left(CacheFailure()));

      //act
      final res = await updateTask(const UpdateTaskParam(tTask));

      //assert
      expect(res, const Left(CacheFailure()));
    },
  );
}
