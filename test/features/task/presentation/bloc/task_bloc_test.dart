import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';
import 'package:my_todo_clean/features/task/domain/usecases/delete_task.dart';
import 'package:my_todo_clean/features/task/domain/usecases/find_tasks.dart';
import 'package:my_todo_clean/features/task/domain/usecases/find_todays_tasks.dart';
import 'package:my_todo_clean/features/task/presentation/bloc/task_bloc.dart';

import 'task_bloc_test.mocks.dart';

@GenerateMocks([FindTasks])
@GenerateMocks([FindTodaysTask])
@GenerateMocks([DeleteTask])
void main() {
  late MockFindTasks mockFindTasks;
  late MockFindTodaysTask mockFindTodaysTask;
  late MockDeleteTask mockDeleteTask;
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

  const tTasksUpdate = [
    TaskEntity(
      id: 0,
      name: 'update test',
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

  const tTasksDeleted = [
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

  const tTaskEntity = TaskEntity(
    id: 0,
    name: 'update test',
    description: 'another test',
    date: '',
    isDone: false,
  );

  // // const tTaskModel = TaskModel(
  // //   id: 0,
  // //   name: 'test',
  // //   description: 'another test',
  // //   date: '',
  // //   isDone: false,
  // // );

  // const TaskState taskInitialState =
  //     TaskState(status: TaskStatus.loading, tasks: [], todayTasks: []);

  setUp(() {
    mockFindTasks = MockFindTasks();
    mockFindTodaysTask = MockFindTodaysTask();
    mockDeleteTask = MockDeleteTask();
    taskBloc = TaskBloc(
      findTasks: mockFindTasks,
      findTodaysTask: mockFindTodaysTask,
      // createTask: mockCreateTaskUseCase,
      // updateTask: mockUpdateTaskUsecase,
      deleteTask: mockDeleteTask,
    );
  });

  tearDown(() {
    taskBloc.close();
  });

  // test(
  //   'Initial data should be TaskStatus.loading',
  //   () {
  //     expect(TaskStatus.loading, taskBloc.state.status);
  //   },
  // );

  // group('OnFindTasks', () {
  //   blocTest(
  //     'should return list project',
  //     build: (() {
  //       when(mockFindTasks(NoParams())).thenAnswer(
  //         (_) async => const Right(tTasks),
  //       );
  //       return taskBloc;
  //     }),
  //     act: (_) => taskBloc.add(OnFindTasks()),
  //     wait: const Duration(milliseconds: 100),
  //     expect: () => [
  //       taskInitialState,
  //       const TaskState(
  //           status: TaskStatus.success, tasks: tTasks, todayTasks: []),
  //     ],
  //   );

  //   blocTest(
  //     'should return server failure',
  //     build: (() {
  //       when(mockFindTasks(NoParams())).thenAnswer(
  //         (_) async => const Left(ServerFailure()),
  //       );
  //       return taskBloc;
  //     }),
  //     act: (_) => taskBloc.add(OnFindTasks()),
  //     wait: const Duration(milliseconds: 100),
  //     expect: () => [
  //       taskInitialState,
  //       const TaskState(
  //           status: TaskStatus.failure,
  //           failure: ServerFailure(),
  //           tasks: [],
  //           todayTasks: []),
  //     ],
  //   );
  // });

  // group('OnFindTodaysTasks', () {
  //   blocTest('Should return the taday\'s tasks list',
  //       build: (() {
  //         when(mockFindTodaysTask(tTasks)).thenReturn(tTodayTasks);
  //         return taskBloc;
  //       }),
  //       seed: () => const TaskState(
  //           status: TaskStatus.loading, tasks: tTasks, todayTasks: []),
  //       act: (_) => taskBloc.add(OnFindTodayTasks()),
  //       expect: () => const [
  //             TaskState(
  //               status: TaskStatus.success,
  //               todayTasks: tTodayTasks,
  //               tasks: tTasks,
  //             )
  //           ]);

  //   blocTest('Empty allTask',
  //       build: (() {
  //         when(mockFindTodaysTask([])).thenReturn([]);
  //         return taskBloc;
  //       }),
  //       seed: () => taskInitialState,
  //       act: (_) => taskBloc.add(OnFindTodayTasks()),
  //       expect: () => const [
  //             TaskState(
  //               status: TaskStatus.success,
  //               todayTasks: [],
  //               tasks: [],
  //             )
  //           ]);
  // });

  // // group('Create Task', () {
  // //   blocTest('should add the new task to the list task',
  // //       build: (() {
  // //         when(mockCreateTaskUseCase(any))
  // //             .thenAnswer((_) async => const Right(tTaskModel));
  // //         return taskBloc;
  // //       }),
  // //       act: (_) => taskBloc.add(const OnCreateTask(tTaskModel)),
  // //       wait: const Duration(milliseconds: 100),
  // //       expect: () => [
  // //             taskInitialState,
  // //             const TaskState(
  // //                 status: TaskStatus.success,
  // //                 tasks: [tTaskModel],
  // //                 todayTasks: [])
  // //           ]);

  // //   blocTest('should add the new task in the end of the list task',
  // //       build: (() {
  // //         when(mockCreateTaskUseCase(any))
  // //             .thenAnswer((_) async => const Right(tTaskModel));
  // //         return taskBloc;
  // //       }),
  // //       act: (_) => taskBloc.add(const OnCreateTask(tTaskModel)),
  // //       seed: () => const TaskState(
  // //           status: TaskStatus.loading, tasks: tTasks, todayTasks: []),
  // //       wait: const Duration(milliseconds: 100),
  // //       expect: () => [
  // //             TaskState(
  // //                 status: TaskStatus.success,
  // //                 tasks: List.of(tTasks)..add(tTaskModel),
  // //                 todayTasks: const [])
  // //           ]);

  // //   blocTest(
  // //       'should emit a failure state when the new task has not been saved to database',
  // //       build: (() {
  // //         when(mockCreateTaskUseCase(any))
  // //             .thenAnswer((_) async => const Left(CacheFailure()));
  // //         return taskBloc;
  // //       }),
  // //       act: (_) => taskBloc.add(const OnCreateTask(tTaskModel)),
  // //       wait: const Duration(milliseconds: 100),
  // //       expect: () => [
  // //             taskInitialState,
  // //             const TaskState(
  // //                 status: TaskStatus.failure,
  // //                 failure: CacheFailure(),
  // //                 tasks: [],
  // //                 todayTasks: [])
  // //           ]);
  // // });

  // group('update task', () {
  //   blocTest('should emit success loading and new tasks update',
  //       build: () {
  //         when(mockUpdateTaskUsecase(any))
  //             .thenAnswer((_) async => const Right(tTaskEntity));
  //         return taskBloc;
  //       },
  //       act: (_) => taskBloc.add(const UpdateTask(tTaskEntity)),
  //       seed: () => const TaskState(
  //           status: TaskStatus.loading, tasks: tTasks, todayTasks: []),
  //       wait: const Duration(milliseconds: 100),
  //       expect: () => [
  //             const TaskState(
  //                 status: TaskStatus.success,
  //                 tasks: tTasksUpdate,
  //                 todayTasks: [])
  //           ]);

  //   blocTest('should emit failure state and the failure',
  //       build: () {
  //         when(mockUpdateTaskUsecase(any))
  //             .thenAnswer((_) async => const Left(CacheFailure()));
  //         return taskBloc;
  //       },
  //       act: (_) => taskBloc.add(const UpdateTask(tTaskEntity)),
  //       wait: const Duration(milliseconds: 100),
  //       expect: () => [
  //             taskInitialState,
  //             const TaskState(
  //                 status: TaskStatus.failure,
  //                 failure: CacheFailure(),
  //                 tasks: [],
  //                 todayTasks: [])
  //           ]);
  // });

  // group('Delete task', () {
  //   blocTest('should delete task in the list of current state task',
  //       build: () {
  //         when(mockDeleteTask(any))
  //             .thenAnswer((_) async => const Right(tTaskEntity));
  //         return taskBloc;
  //       },
  //       act: (_) => taskBloc.add(const OnDeleteTask(tTaskEntity)),
  //       seed: () => const TaskState(
  //           status: TaskStatus.loading, tasks: tTasks, todayTasks: []),
  //       wait: const Duration(milliseconds: 100),
  //       expect: () => [
  //             const TaskState(
  //                 status: TaskStatus.success,
  //                 tasks: tTasksDeleted,
  //                 todayTasks: [])
  //           ]);

  //   blocTest(
  //     'should return failure',
  //     build: () {
  //       when(mockDeleteTask(any))
  //           .thenAnswer((_) async => const Left(CacheFailure()));
  //       return taskBloc;
  //     },
  //     act: (_) => taskBloc.add(const OnDeleteTask(tTaskEntity)),
  //     wait: const Duration(milliseconds: 100),
  //     expect: () => [
  //       taskInitialState,
  //       const TaskState(
  //         status: TaskStatus.failure,
  //         tasks: [],
  //         todayTasks: [],
  //         failure: CacheFailure(),
  //       )
  //     ],
  //   );
  // });

  group('Today and future task', () {
    final today = DateTime.now();
    final tAllTasks = [
      TaskEntity(
        id: 0,
        name: 'test',
        description: 'another test',
        date: DateFormat('yyyy-MM-dd HH:mm')
            .format(today.add(const Duration(minutes: 1))),
        isDone: false,
      ),
      TaskEntity(
        id: 1,
        name: 'test1',
        description: 'another test 1',
        date: DateFormat('yyyy-MM-dd HH:mm')
            .format(today.subtract(const Duration(days: 2))),
        isDone: false,
      ),
      TaskEntity(
        id: 2,
        name: 'test2',
        description: 'another test 2',
        date: DateFormat('yyyy-MM-dd HH:mm')
            .format(today.add(const Duration(days: 2, minutes: 30))),
        isDone: false,
      ),
      TaskEntity(
        id: 3,
        name: 'test3',
        description: 'another test 3',
        date: DateFormat('yyyy-MM-dd HH:mm')
            .format(today.add(const Duration(days: 2))),
        isDone: false,
      ),
      TaskEntity(
        id: 4,
        name: 'test4',
        description: 'another test 4',
        date: DateFormat('yyyy-MM-dd HH:mm')
            .format(today.add(const Duration(days: 2, minutes: 40))),
        isDone: false,
      ),
      TaskEntity(
        id: 5,
        name: 'test5',
        description: 'another test 5',
        date: DateFormat('yyyy-MM-dd HH:mm')
            .format(today.subtract(const Duration(days: 3, minutes: 40))),
        isDone: false,
      ),
    ];

    final tTodayAndFutureTasks = [
      TaskEntity(
        id: 0,
        name: 'test',
        description: 'another test',
        date: DateFormat('yyyy-MM-dd HH:mm')
            .format(today.add(const Duration(minutes: 1))),
        isDone: false,
      ),
      TaskEntity(
        id: 3,
        name: 'test3',
        description: 'another test 3',
        date: DateFormat('yyyy-MM-dd HH:mm')
            .format(today.add(const Duration(days: 2))),
        isDone: false,
      ),
      TaskEntity(
        id: 2,
        name: 'test2',
        description: 'another test 2',
        date: DateFormat('yyyy-MM-dd HH:mm')
            .format(today.add(const Duration(days: 2, minutes: 30))),
        isDone: false,
      ),
      TaskEntity(
        id: 4,
        name: 'test4',
        description: 'another test 4',
        date: DateFormat('yyyy-MM-dd HH:mm')
            .format(today.add(const Duration(days: 2, minutes: 40))),
        isDone: false,
      ),
    ];
    blocTest(
      'Should return only today and future tasks',
      build: () {
        return taskBloc;
      },
      seed: () => TaskState(
          status: TaskStatus.loading,
          tasks: tAllTasks,
          todayTasks: const [],
          todayAndFutureTasks: const []),
      act: (_) => taskBloc.add(OnFindTodayAndFutureTasks()),
      expect: () => [
        equals(
          TaskState(
            status: TaskStatus.success,
            tasks: tAllTasks,
            todayTasks: const [],
            todayAndFutureTasks: tTodayAndFutureTasks,
          ),
        )
      ],
    );
  });
}
