import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/failure.dart';
import 'package:my_todo_clean/features/create_new_task/data/models/task_title.dart';
import 'package:my_todo_clean/features/create_new_task/domain/usecases/create_task_usecase.dart';
import 'package:my_todo_clean/features/create_new_task/domain/usecases/update_task.dart';
import 'package:my_todo_clean/features/create_new_task/presentation/bloc/new_task_bloc.dart';
import 'package:my_todo_clean/features/task/data/model/task_model.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';

import 'new_task_bloc_test.mocks.dart';

@GenerateMocks([CreateTaskUseCase])
@GenerateMocks([UpdateTaskUsecase])
void main() {
  late MockCreateTaskUseCase mockCreateTaskUseCase;
  late MockUpdateTaskUsecase mockUpdateTaskUseCase;
  late NewTaskBloc newTaskBloc;

  const tTaskModel = TaskModel(
    id: 0,
    name: 'test',
    description: 'another test',
    date: '',
    isDone: false,
  );

  const tTaskEntity = TaskEntity(
    id: 0,
    name: 'update test',
    description: 'another test',
    date: '',
    isDone: false,
  );

  NewTaskState taskInitialState = NewTaskState(
    status: NewTaskStatus.loading,
    title: const TaskTitle.pure(),
    date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    time: DateFormat('HH:mm').format(DateTime.now()),
  );

  setUp(() {
    mockCreateTaskUseCase = MockCreateTaskUseCase();
    mockUpdateTaskUseCase = MockUpdateTaskUsecase();
    newTaskBloc = NewTaskBloc(
      createTask: mockCreateTaskUseCase,
      updateTask: mockUpdateTaskUseCase,
    );
  });

  group('Create Task', () {
    blocTest('should add the new task to the list task',
        build: (() {
          when(mockCreateTaskUseCase(any))
              .thenAnswer((_) async => const Right(tTaskModel));
          return newTaskBloc;
        }),
        act: (_) => newTaskBloc.add(const OnCreateTask(
              task: tTaskModel,
            )),
        wait: const Duration(milliseconds: 100),
        expect: () => [
              taskInitialState,
              const NewTaskState(
                status: NewTaskStatus.success,
              )
            ]);

    blocTest('should add the new task in the end of the list task',
        build: (() {
          when(mockCreateTaskUseCase(any))
              .thenAnswer((_) async => const Right(tTaskModel));
          return newTaskBloc;
        }),
        act: (_) => newTaskBloc.add(const OnCreateTask(tTaskModel)),
        seed: () => const NewTaskState(
              status: NewTaskStatus.loading,
            ),
        wait: const Duration(milliseconds: 100),
        expect: () => [
              NewTaskState(
                status: NewTaskStatus.success,
              )
            ]);

    blocTest(
        'should emit a failure state when the new task has not been saved to database',
        build: (() {
          when(mockCreateTaskUseCase(any))
              .thenAnswer((_) async => const Left(CacheFailure()));
          return newTaskBloc;
        }),
        act: (_) => newTaskBloc.add(const OnCreateTask(tTaskModel)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
              taskInitialState,
              const NewTaskState(
                status: NewTaskStatus.failure,
                failure: CacheFailure(),
              )
            ]);
  });

  group('update task', () {
    blocTest('should emit success loading and new tasks update',
        build: () {
          when(mockUpdateTaskUseCase(any))
              .thenAnswer((_) async => const Right(tTaskEntity));
          return newTaskBloc;
        },
        act: (_) => newTaskBloc.add(const OnUpdateTask(tTaskEntity)),
        seed: () => const NewTaskState(
              status: NewTaskStatus.loading,
            ),
        wait: const Duration(milliseconds: 100),
        expect: () => [
              const NewTaskState(
                status: NewTaskStatus.success,
              )
            ]);

    blocTest('should emit failure state and the failure',
        build: () {
          when(mockUpdateTaskUseCase(any))
              .thenAnswer((_) async => const Left(CacheFailure()));
          return NewTaskBloc;
        },
        act: (_) => newTaskBloc.add(const OnUpdateTask(tTaskEntity)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
              taskInitialState,
              const NewTaskState(
                status: NewTaskStatus.failure,
                failure: CacheFailure(),
              )
            ]);
  });
}
