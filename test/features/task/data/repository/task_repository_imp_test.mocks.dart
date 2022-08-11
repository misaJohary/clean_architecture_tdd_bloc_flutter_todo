// Mocks generated by Mockito 5.3.0 from annotations
// in my_todo_clean/test/features/task/data/repository/task_repository_imp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:my_todo_clean/features/task/data/data_sources/local_data_sources.dart'
    as _i4;
import 'package:my_todo_clean/features/task/data/model/task_model.dart' as _i2;
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart'
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

class _FakeTaskModel_0 extends _i1.SmartFake implements _i2.TaskModel {
  _FakeTaskModel_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeTaskEntity_1 extends _i1.SmartFake implements _i3.TaskEntity {
  _FakeTaskEntity_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [TaskLocalDataSources].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskLocalDataSources extends _i1.Mock
    implements _i4.TaskLocalDataSources {
  MockTaskLocalDataSources() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i2.TaskModel>> findTasks() => (super.noSuchMethod(
          Invocation.method(#findTasks, []),
          returnValue: _i5.Future<List<_i2.TaskModel>>.value(<_i2.TaskModel>[]))
      as _i5.Future<List<_i2.TaskModel>>);
  @override
  _i5.Future<_i2.TaskModel> createTask(_i2.TaskModel? task) =>
      (super.noSuchMethod(Invocation.method(#createTask, [task]),
              returnValue: _i5.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
                  this, Invocation.method(#createTask, [task]))))
          as _i5.Future<_i2.TaskModel>);
  @override
  _i5.Future<_i3.TaskEntity> updateTask(_i3.TaskEntity? task) =>
      (super.noSuchMethod(Invocation.method(#updateTask, [task]),
              returnValue: _i5.Future<_i3.TaskEntity>.value(_FakeTaskEntity_1(
                  this, Invocation.method(#updateTask, [task]))))
          as _i5.Future<_i3.TaskEntity>);
  @override
  _i5.Future<_i3.TaskEntity> deleteTask(_i3.TaskEntity? task) =>
      (super.noSuchMethod(Invocation.method(#deleteTask, [task]),
              returnValue: _i5.Future<_i3.TaskEntity>.value(_FakeTaskEntity_1(
                  this, Invocation.method(#deleteTask, [task]))))
          as _i5.Future<_i3.TaskEntity>);
}
