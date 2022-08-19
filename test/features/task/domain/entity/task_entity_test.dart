import 'package:flutter_test/flutter_test.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';

void main() {
  group(
    'SwitchMarkdown',
    () {
      const tTaskDone = TaskEntity(
        id: 1,
        name: 'test1',
        description: 'another test 1',
        date: '2022-08-10 10:30',
        isDone: true,
      );

      const tTaskNotDone = TaskEntity(
        id: 1,
        name: 'test1',
        description: 'another test 1',
        date: '2022-08-10 10:30',
        isDone: false,
      );
      test(
        'Should mark the task as not done',
        () async {
          final res = TaskEntity.switchMarkDone(tTaskDone);

          expect(res, tTaskNotDone);
        },
      );

      test(
        'Should mark the task as done',
        () async {
          final res = TaskEntity.switchMarkDone(tTaskNotDone);

          expect(res, tTaskDone);
        },
      );
    },
  );
}
