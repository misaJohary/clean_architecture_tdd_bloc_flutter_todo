import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/failure.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';
import 'package:my_todo_clean/features/task/domain/repository/task_repository.dart';
import 'package:my_todo_clean/features/task/domain/usecases/update_task.dart';

import 'create_task_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late MockTaskRepository mockTaskRepository;
  late UpdateTaskUsecase updateTask;

  const TaskEntity tTask = TaskEntity(
    id: 0,
    name: 'test',
    description: 'another test',
    date: '',
    isDone: false,
  );

  setUp(() {
    mockTaskRepository = MockTaskRepository();
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
