import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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
    date: '23-08-2022 12:23',
    isDone: false,
  );

  const tTaskEntity = TaskEntity(
    id: 0,
    name: 'update test',
    description: 'another test',
    date: '',
    isDone: false,
  );

  const NewTaskState taskInitialState = NewTaskState(
    updateStatus: NewTaskStatus.loading,
    title: TaskTitle.pure(),
    date: '23-08-2022',
    time: '12:23',
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
        seed: () => taskInitialState,
        act: (_) => newTaskBloc.add(
              const OnCreateTask(
                task: tTaskModel,
              ),
            ),
        wait: const Duration(milliseconds: 100),
        expect: () => [
              const NewTaskState(
                status: NewTaskStatus.success,
                title: TaskTitle.pure(),
                description: null,
                date: '23-08-2022',
                time: '12:23',
              )
            ]);

    blocTest(
        'should emit a failure state when the new task has not been saved to database',
        build: (() {
          when(mockCreateTaskUseCase(any))
              .thenAnswer((_) async => const Left(CacheFailure()));
          return newTaskBloc;
        }),
        seed: () => taskInitialState,
        act: (_) => newTaskBloc.add(const OnCreateTask(task: tTaskModel)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
              const NewTaskState(
                status: NewTaskStatus.failure,
                failure: CacheFailure(),
                title: TaskTitle.pure(),
                date: '23-08-2022',
                time: '12:23',
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
        act: (_) => newTaskBloc.add(const OnUpdateTask(task: tTaskEntity)),
        seed: () => taskInitialState,
        wait: const Duration(milliseconds: 100),
        expect: () => [
              const NewTaskState(
                updateStatus: NewTaskStatus.success,
                title: TaskTitle.pure(),
                date: '23-08-2022',
                time: '12:23',
              ),
              const NewTaskState(
                updateStatus: NewTaskStatus.loading,
                title: TaskTitle.pure(),
                date: '23-08-2022',
                time: '12:23',
              )
            ]);

    blocTest('should emit failure state and the failure',
        build: () {
          when(mockUpdateTaskUseCase(any))
              .thenAnswer((_) async => const Left(CacheFailure()));
          return newTaskBloc;
        },
        act: (_) => newTaskBloc.add(const OnUpdateTask(task: tTaskEntity)),
        seed: () => taskInitialState,
        wait: const Duration(milliseconds: 100),
        expect: () => [
              const NewTaskState(
                updateStatus: NewTaskStatus.failure,
                failure: CacheFailure(),
                title: TaskTitle.pure(),
                date: '23-08-2022',
                time: '12:23',
              ),
              const NewTaskState(
                updateStatus: NewTaskStatus.loading,
                failure: CacheFailure(),
                title: TaskTitle.pure(),
                date: '23-08-2022',
                time: '12:23',
              )
            ]);
  });
}
