import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/base_repository/base_repository.dart';
import 'package:my_todo_clean/core/error/exception.dart';
import 'package:my_todo_clean/features/task/data/data_sources/remote_data_sources.dart';
import 'package:my_todo_clean/features/task/data/model/task_model.dart';

import '../../../../fixture/fixture_reader.dart';
import 'remote_data_sources_test.mocks.dart';

@GenerateMocks([BaseRepository])
void main() {
  late MockBaseRepository mockBaseRepository;
  late TaskRemoteDataSourceImp taskRemoteDataSource;

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
    mockBaseRepository = MockBaseRepository();
    taskRemoteDataSource = TaskRemoteDataSourceImp(mockBaseRepository);
  });

  test(
    'should return a list of task when get success data',
    () async {
      // arrange
      when(mockBaseRepository.get(any)).thenAnswer(
        (_) async => http.Response(fixture('tasks_success_response'), 200),
      );

      //act
      final res = await taskRemoteDataSource.findTasks();

      //assert
      expect(
        res,
        tTasksModel,
      );
    },
  );

  test(
    'should throw exception when get data unsuccess',
    () async {
      // arrange
      when(mockBaseRepository.get(any)).thenAnswer(
        (_) async => http.Response('Server error', 500),
      );

      //act
      final call = taskRemoteDataSource.findTasks;

      //assert
      expect(
        () => call(),
        throwsA(const TypeMatcher<ServerException>()),
      );
    },
  );
}
