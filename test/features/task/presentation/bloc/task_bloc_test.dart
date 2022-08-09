import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/failure.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';
import 'package:my_todo_clean/features/task/domain/usecases/find_tasks.dart';
import 'package:my_todo_clean/features/task/presentation/bloc/task_bloc.dart';

import 'task_bloc_test.mocks.dart';

@GenerateMocks([FindTasks])
void main() {
  late MockFindTasks mockUsecase;
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

  setUp(() {
    mockUsecase = MockFindTasks();
    taskBloc = TaskBloc(findTasks: mockUsecase);
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

  blocTest(
    'should return list project',
    build: (() {
      when(mockUsecase(NoParams())).thenAnswer(
        (_) async => const Right(tTasks),
      );
      return taskBloc;
    }),
    act: (_) => taskBloc.add(OnFindTasks()),
    wait: const Duration(milliseconds: 100),
    expect: () => const [
      TaskState(status: TaskStatus.loading),
      TaskState(status: TaskStatus.success, tasks: tTasks),
    ],
  );

  blocTest(
    'should return list project',
    build: (() {
      when(mockUsecase(NoParams())).thenAnswer(
        (_) async => const Right(tTasks),
      );
      return taskBloc;
    }),
    act: (_) => taskBloc.add(OnFindTasks()),
    wait: const Duration(milliseconds: 100),
    expect: () => const [
      TaskState(status: TaskStatus.loading),
      TaskState(status: TaskStatus.success, tasks: tTasks),
    ],
  );

  blocTest(
    'should return server failure',
    build: (() {
      when(mockUsecase(NoParams())).thenAnswer(
        (_) async => const Left(ServerFailure()),
      );
      return taskBloc;
    }),
    act: (_) => taskBloc.add(OnFindTasks()),
    wait: const Duration(milliseconds: 100),
    expect: () => const [
      TaskState(status: TaskStatus.loading),
      TaskState(status: TaskStatus.failure, failure: ServerFailure()),
    ],
  );
}
