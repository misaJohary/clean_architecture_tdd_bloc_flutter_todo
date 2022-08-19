import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/error/failure.dart';
import 'package:my_todo_clean/features/create_new_task/domain/reporitory/new_task_repository.dart';
import 'package:my_todo_clean/features/create_new_task/domain/usecases/create_task_usecase.dart';
import 'package:my_todo_clean/features/task/data/model/task_model.dart';

import 'create_task_usecase_test.mocks.dart';

@GenerateMocks([NewTaskRepository])
void main() {
  late MockNewTaskRepository mockTaskRepository;
  late CreateTaskUseCase usecase;

  const tTask = TaskModel(
    id: 1,
    name: 'test1',
    description: 'another test 1',
    date: '2022-08-10 10:30',
    isDone: false,
  );

  setUp(() {
    mockTaskRepository = MockNewTaskRepository();
    usecase = CreateTaskUseCase(mockTaskRepository);
  });

  test(
    'Should return the task entity which has been created',
    () async {
      //arrange
      when(mockTaskRepository.createTask(tTask))
          .thenAnswer((_) async => const Right(tTask));

      //act
      final res = await usecase(const AddTaskParam(tTask));

      //assert
      expect(res, const Right(tTask));
      verify(mockTaskRepository.createTask(tTask));
      verifyNoMoreInteractions(mockTaskRepository);
    },
  );

  test('Should return a failure', () async {
    //arrange
    when(mockTaskRepository.createTask(tTask))
        .thenAnswer((_) async => const Left(CacheFailure()));

    //act
    final res = await usecase(const AddTaskParam(tTask));

    //assert
    expect(res, const Left(CacheFailure()));
    verify(mockTaskRepository.createTask(tTask));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
