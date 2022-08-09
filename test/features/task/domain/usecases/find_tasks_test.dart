import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/failure.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';
import 'package:my_todo_clean/features/task/domain/repository/task_repository.dart';
import 'package:my_todo_clean/features/task/domain/usecases/find_tasks.dart';

import 'find_tasks_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late MockTaskRepository mockRepository;
  late FindTasks usecase;

  const tTasks = [
    TaskEntity(
      id: 0,
      name: 'test',
      description: 'another test',
      date: '',
      isDone: false,
    ),
    TaskEntity(
      id: 1,
      name: 'test1',
      description: 'another test 1',
      date: '',
      isDone: false,
    ),
    TaskEntity(
      id: 2,
      name: 'test2',
      description: 'another test 2',
      date: '',
      isDone: false,
    ),
  ];

  setUp(() {
    mockRepository = MockTaskRepository();
    usecase = FindTasks(mockRepository);
  });

  test(
    'should call the repository.findTasks method',
    () async {
      /// arrange
      when(mockRepository.findTasks())
          .thenAnswer((_) async => const Right(tTasks));

      /// act
      await usecase(NoParams());

      /// assert
      verify(mockRepository.findTasks());
    },
  );

  test(
    'should return all task',
    () async {
      /// arrange
      when(mockRepository.findTasks())
          .thenAnswer((_) async => const Right(tTasks));

      /// act
      await usecase(NoParams());

      /// assert
      verify(mockRepository.findTasks());
    },
  );

  test(
    'should return all task',
    () async {
      /// arrange
      when(mockRepository.findTasks())
          .thenAnswer((_) async => const Right(tTasks));

      /// act
      final res = await usecase(NoParams());

      /// assert
      expect(res, const Right(tTasks));
      verify(mockRepository.findTasks());
    },
  );

  test(
    'should return cache failure',
    () async {
      /// arrange
      when(mockRepository.findTasks())
          .thenAnswer((_) async => const Left(CacheFailure()));

      /// act
      final res = await usecase(NoParams());

      /// assert
      expect(res, const Left(CacheFailure()));
      verify(mockRepository.findTasks());
    },
  );
}
