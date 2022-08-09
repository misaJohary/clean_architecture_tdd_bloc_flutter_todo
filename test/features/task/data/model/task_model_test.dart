import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_todo_clean/features/task/data/model/task_model.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  const tTaskModel = TaskModel(
    id: 0,
    name: 'test',
    description: 'another test',
    date: '',
    isDone: false,
  );
  test(
    'Should be a subtype of TaskEntity',
    () {
      expect(tTaskModel, isA<TaskEntity>());
    },
  );

  test(
    'fromJson',
    () {
      final res = TaskModel.fromJson(
        json.decode(
          fixture('task'),
        ),
      );
      expect(res, tTaskModel);
    },
  );

  test('toJson', () {
    final res = tTaskModel.toJson();
    expect(
      res,
      json.decode(fixture('task')),
    );
  });
}
