import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/failure.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';
import 'package:my_todo_clean/features/task/domain/usecases/find_tasks.dart';
import 'package:my_todo_clean/features/task/domain/usecases/find_todays_tasks.dart';
import 'package:my_todo_clean/features/task/presentation/bloc/task_bloc.dart';

import 'task_bloc_test.mocks.dart';

@GenerateMocks([FindTasks])
@GenerateMocks([FindTodaysTask])
void main() {
  late MockFindTasks mockFindTasks;
  late MockFindTodaysTask mockFindTodaysTask;
  late TaskBloc taskBloc;

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

  const tTodayTasks = [
    TaskEntity(
      id: 0,
      name: 'test',
      description: 'another test',
      date: '2022-08-10 10:00',
      isDone: false,
    ),
    TaskEntity(
      id: 2,
      name: 'test2',
      description: 'another test 2',
      date: '2022-08-10 10:00',
      isDone: false,
    ),
  ];

  const TaskState taskInitialState =
      TaskState(status: TaskStatus.loading, tasks: [], todayTasks: []);

  setUp(() {
    mockFindTasks = MockFindTasks();
    mockFindTodaysTask = MockFindTodaysTask();
    taskBloc =
        TaskBloc(findTasks: mockFindTasks, findTodaysTask: mockFindTodaysTask);
  });

  tearDown(() {
    taskBloc.close();
  });

  test(
    'Initial data should be TaskStatus.loading',
    () {
      expect(TaskStatus.loading, taskBloc.state.status);
    },
  );

  group('OnFindTasks', () {
    blocTest(
      'should return list project',
      build: (() {
        when(mockFindTasks(NoParams())).thenAnswer(
          (_) async => const Right(tTasks),
        );
        return taskBloc;
      }),
      act: (_) => taskBloc.add(OnFindTasks()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        taskInitialState,
        const TaskState(
            status: TaskStatus.success, tasks: tTasks, todayTasks: []),
      ],
    );

    blocTest(
      'should return server failure',
      build: (() {
        when(mockFindTasks(NoParams())).thenAnswer(
          (_) async => const Left(ServerFailure()),
        );
        return taskBloc;
      }),
      act: (_) => taskBloc.add(OnFindTasks()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        taskInitialState,
        const TaskState(
            status: TaskStatus.failure,
            failure: ServerFailure(),
            tasks: [],
            todayTasks: []),
      ],
    );
  });

  group('OnFindTodaysTasks', () {
    blocTest('Should return the taday\'s tasks list',
        build: (() {
          when(mockFindTodaysTask(tTasks)).thenReturn(tTodayTasks);
          return taskBloc;
        }),
        seed: () => const TaskState(
            status: TaskStatus.loading, tasks: tTasks, todayTasks: []),
        act: (_) => taskBloc.add(OnFindTodayTasks()),
        expect: () => const [
              TaskState(
                status: TaskStatus.success,
                todayTasks: tTodayTasks,
                tasks: tTasks,
              )
            ]);

    blocTest('Empty allTask',
        build: (() {
          when(mockFindTodaysTask([])).thenReturn([]);
          return taskBloc;
        }),
        seed: () => taskInitialState,
        act: (_) => taskBloc.add(OnFindTodayTasks()),
        expect: () => const [
              TaskState(
                status: TaskStatus.success,
                todayTasks: [],
                tasks: [],
              )
            ]);
  });
}
