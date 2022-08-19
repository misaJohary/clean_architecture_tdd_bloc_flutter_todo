import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/exception.dart';
import 'package:my_todo_clean/core/error/failure.dart';
import 'package:my_todo_clean/features/create_new_task/data/data_sources/local_data_sources.dart';
import 'package:my_todo_clean/features/create_new_task/data/repository/create_new_task_repository.dart';
import 'package:my_todo_clean/features/task/data/model/task_model.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';

import 'create_new_task_repository_test.mocks.dart';

@GenerateMocks([NewTaskLocalDataSources])
void main() {
  late MockNewTaskLocalDataSources mockLocalDataSource;
  late NewTaskRepositoryImp repoImp;

  const TaskModel tTaskModel = TaskModel(
    id: 0,
    name: 'test',
    description: 'another test',
    date: '',
    isDone: false,
  );

  const TaskEntity tTask = TaskEntity(
    id: 0,
    name: 'test',
    description: 'another test',
    date: '',
    isDone: false,
  );

  setUp(() {
    mockLocalDataSource = MockNewTaskLocalDataSources();
    repoImp = NewTaskRepositoryImp(mockLocalDataSource);
  });
  group('Create task', () {
    test(
      'Should return a task model',
      () async {
        //arrange
        when(mockLocalDataSource.createTask(tTaskModel))
            .thenAnswer((_) async => tTaskModel);

        //act
        final res = await repoImp.createTask(tTaskModel);

        //assert
        expect(res, equals(const Right(tTaskModel)));
      },
    );
    test(
      'Should return cache failure',
      () async {
        //arrange
        when(mockLocalDataSource.createTask(tTaskModel))
            .thenThrow(CacheException());

        //act
        final res = await repoImp.createTask(tTaskModel);

        //assert
        expect(res, equals(const Left(CacheFailure())));
      },
    );
  });

  group('Update task', () {
    test(
      'Should return task entity',
      () async {
        //arrange
        when(mockLocalDataSource.updateTask(tTask))
            .thenAnswer((_) async => tTask);

        //act
        final res = await repoImp.updateTask(tTask);

        //assert
        expect(
          res,
          const Right(tTask),
        );
      },
    );

    test(
      'Should return cache failure',
      () async {
        //arrange
        when(mockLocalDataSource.updateTask(tTask)).thenThrow(CacheException());

        //act
        final res = await repoImp.updateTask(tTask);

        //assert
        expect(
          res,
          const Left(CacheFailure()),
        );
      },
    );
  });
}
