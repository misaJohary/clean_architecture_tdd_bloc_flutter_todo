// Mocks generated by Mockito 5.3.0 from annotations
// in my_todo_clean/test/features/task/domain/usecases/update_task_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:my_todo_clean/core/error/failure.dart' as _i5;
import 'package:my_todo_clean/features/task/data/model/task_model.dart' as _i7;
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart'
    as _i6;
import 'package:my_todo_clean/features/task/domain/repository/task_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [TaskRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskRepository extends _i1.Mock implements _i3.TaskRepository {
  MockTaskRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TaskEntity>>> findTasks() =>
      (super.noSuchMethod(Invocation.method(#findTasks, []),
          returnValue:
              _i4.Future<_i2.Either<_i5.Failure, List<_i6.TaskEntity>>>.value(
                  _FakeEither_0<_i5.Failure, List<_i6.TaskEntity>>(
                      this, Invocation.method(#findTasks, [])))) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i6.TaskEntity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.TaskEntity>> createTask(
          _i7.TaskModel? task) =>
      (super.noSuchMethod(Invocation.method(#createTask, [task]),
              returnValue:
                  _i4.Future<_i2.Either<_i5.Failure, _i6.TaskEntity>>.value(
                      _FakeEither_0<_i5.Failure, _i6.TaskEntity>(
                          this, Invocation.method(#createTask, [task]))))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.TaskEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.TaskEntity>> updateTask(
          _i6.TaskEntity? task) =>
      (super.noSuchMethod(Invocation.method(#updateTask, [task]),
              returnValue:
                  _i4.Future<_i2.Either<_i5.Failure, _i6.TaskEntity>>.value(
                      _FakeEither_0<_i5.Failure, _i6.TaskEntity>(
                          this, Invocation.method(#updateTask, [task]))))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.TaskEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.TaskEntity>> deleteTask(
          _i6.TaskEntity? task) =>
      (super.noSuchMethod(Invocation.method(#deleteTask, [task]),
              returnValue:
                  _i4.Future<_i2.Either<_i5.Failure, _i6.TaskEntity>>.value(
                      _FakeEither_0<_i5.Failure, _i6.TaskEntity>(
                          this, Invocation.method(#deleteTask, [task]))))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.TaskEntity>>);
}
