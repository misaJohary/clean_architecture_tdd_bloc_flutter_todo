import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/failure.dart';
import 'package:my_todo_clean/dependency_injection.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';
import 'package:my_todo_clean/features/task/domain/repository/task_repository.dart';
import 'package:my_todo_clean/features/task/domain/usecases/delete_task.dart';

import 'delete_task_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late MockTaskRepository mockTaskRepository;
  late DeleteTask usecase;

  const TaskEntity tTask = TaskEntity(
    id: 0,
    name: 'test',
    description: 'another test',
    date: '',
    isDone: false,
  );

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = DeleteTask(mockTaskRepository);
  });

  group('Task Usecase', () {
    test(
      'Should return task entity',
      () async {
        //arrange
        when(mockTaskRepository.deleteTask(tTask))
            .thenAnswer((_) async => const Right(tTask));

        //act
        final res = await usecase(const DeleteTaskParam(tTask));

        //assert
        expect(res, const Right(tTask));
      },
    );

    test(
      'Should return failure',
      () async {
        //arrange
        when(mockTaskRepository.deleteTask(any))
            .thenAnswer((_) async => const Left(CacheFailure()));

        //act
        final res = await usecase(const DeleteTaskParam(tTask));

        //assert
        expect(res, const Left(CacheFailure()));
      },
    );
  });
}
