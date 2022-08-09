import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/exception.dart';
import 'package:my_todo_clean/core/error/failure.dart';
import 'package:my_todo_clean/features/task/data/data_sources/local_data_sources.dart';
import 'package:my_todo_clean/features/task/data/model/task_model.dart';
import 'package:my_todo_clean/features/task/data/repository/task_repository_imp.dart';

import 'task_repository_imp_test.mocks.dart';

@GenerateMocks([TaskLocalDataSources])
void main() {
  late MockTaskLocalDataSources mockLocalDataSource;
  late TaskRepositoryImp repoImp;

  const tTasksModel = [
    TaskModel(
      id: 0,
      name: 'test',
      description: 'another test',
      date: '',
      isDone: false,
    ),
    TaskModel(
      id: 1,
      name: 'test1',
      description: 'another test 1',
      date: '',
      isDone: false,
    ),
    TaskModel(
      id: 2,
      name: 'test2',
      description: 'another test 2',
      date: '',
      isDone: false,
    ),
  ];

  setUp(() {
    mockLocalDataSource = MockTaskLocalDataSources();
    repoImp = TaskRepositoryImp(mockLocalDataSource);
  });

  test(
    'Should call the taskLocaldatasource',
    () async {
      // arrange
      when(mockLocalDataSource.findTasks())
          .thenAnswer((_) async => tTasksModel);

      // act
      await repoImp.findTasks();

      // assert
      verify(mockLocalDataSource.findTasks());
    },
  );
  test(
    'Should return the task list form Local data source',
    () async {
      // arrange
      when(mockLocalDataSource.findTasks())
          .thenAnswer((_) async => tTasksModel);

      // act
      final res = await repoImp.findTasks();

      // assert
      verify(mockLocalDataSource.findTasks());
      expect(res, const Right(tTasksModel));
    },
  );

  test(
    'Should return cache failure form Local data source',
    () async {
      // arrange
      when(mockLocalDataSource.findTasks()).thenThrow(CacheException());

      // act
      final res = await repoImp.findTasks();

      // assert
      verify(mockLocalDataSource.findTasks());
      expect(res, const Left(CacheFailure()));
    },
  );
}
