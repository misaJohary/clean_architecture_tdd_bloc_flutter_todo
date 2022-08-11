import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/exception.dart';
import 'package:my_todo_clean/core/services/db.dart';
import 'package:my_todo_clean/features/task/data/data_sources/local_data_sources.dart';
import 'package:my_todo_clean/features/task/data/model/task_model.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';

import 'local_data_sources_test.mocks.dart';

@GenerateMocks([DbService])
void main() {
  late MockDbService mockDbService;
  late TaskLocalDataSourcesImp localImp;

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

  const tTaskModel = TaskModel(
    id: 0,
    name: 'test',
    description: 'another test',
    date: '',
    isDone: false,
  );

  const tTaskEntity = TaskEntity(
    id: 0,
    name: 'test',
    description: 'another test',
    date: '',
    isDone: false,
  );

  setUp(() {
    mockDbService = MockDbService();
    localImp = TaskLocalDataSourcesImp(db: mockDbService);
  });

  group('find tasks', () {
    test(
      'Should find tasks from data base',
      () async {
        when(mockDbService.allItems()).thenAnswer((_) async => tTasksModel);

        final res = await localImp.findTasks();

        expect(
          res,
          tTasksModel,
        );
      },
    );

    test(
      'Should throw cache exception',
      () async {
        when(mockDbService.allItems()).thenThrow(Exception());

        final call = localImp.findTasks;

        expect(
          () => call(),
          throwsA(const TypeMatcher<CacheException>()),
        );
      },
    );
  });

  group('create task', () {
    test(
      'should cache the new task',
      () async {
        //Arrange
        when(mockDbService.createItem(tTaskModel)).thenAnswer((_) async => 1);

        //act
        await localImp.createTask(tTaskModel);

        //arrange
        verify(mockDbService.createItem(tTaskModel));
      },
    );

    test(
      'should return the task successfully saved',
      () async {
        //Arrange
        when(mockDbService.createItem(tTaskModel)).thenAnswer((_) async => 1);

        //act
        final res = await localImp.createTask(tTaskModel);

        //arrange
        expect(res, tTaskModel);
        verify(mockDbService.createItem(tTaskModel));
      },
    );

    test(
      'should throw cache exception when there is error',
      () async {
        //Arrange
        when(mockDbService.createItem(tTaskModel)).thenAnswer((_) async => 0);

        //act
        final call = localImp.createTask;

        //arrange
        expect(() => call(tTaskModel),
            throwsA(const TypeMatcher<CacheException>()));
        verify(mockDbService.createItem(tTaskModel));
      },
    );
  });

  group('Update task', () {
    test(
      'should return task',
      () async {
        //arrange
        when(mockDbService.updateItem(tTaskModel)).thenAnswer((_) async => 1);

        //act
        final res = await localImp.updateTask(tTaskModel);

        //assert
        expect(res, tTaskModel);
      },
    );

    test(
      'should return failure',
      () async {
        //arrange
        when(mockDbService.updateItem(tTaskModel)).thenAnswer((_) async => 0);

        //act
        final call = localImp.updateTask;

        //assert
        expect(() => call(tTaskModel),
            throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });

  group('Delete task', () {
    test(
      'should return task',
      () async {
        when(mockDbService.deleteItem(any)).thenAnswer((_) async => 1);

        final res = await localImp.deleteTask(tTaskEntity);

        expect(res, tTaskEntity);
        verify(mockDbService.deleteItem(any));
      },
    );

    test(
      'Should throw exception when the db return 0',
      () async {
        when(mockDbService.deleteItem(any)).thenAnswer((_) async => 0);

        final call = localImp.deleteTask;

        expect(() => call(tTaskEntity),
            throwsA(const TypeMatcher<CacheException>()));
        verify(mockDbService.deleteItem(any));
      },
    );
  });
}
