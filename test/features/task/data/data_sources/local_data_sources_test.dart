import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/exception.dart';
import 'package:my_todo_clean/core/error/failure.dart';
import 'package:my_todo_clean/core/services/db.dart';
import 'package:my_todo_clean/features/task/data/data_sources/local_data_sources.dart';
import 'package:my_todo_clean/features/task/data/model/task_model.dart';

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

  setUp(() {
    mockDbService = MockDbService();
    localImp = TaskLocalDataSourcesImp(db: mockDbService);
  });

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
}
