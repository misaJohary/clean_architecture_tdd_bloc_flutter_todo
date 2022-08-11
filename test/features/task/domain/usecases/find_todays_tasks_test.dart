import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo_clean/core/helpers/datetime_factory.dart';
import 'package:my_todo_clean/features/task/domain/entity/task_entity.dart';
import 'package:my_todo_clean/features/task/domain/usecases/find_todays_tasks.dart';

import 'find_todays_tasks_test.mocks.dart';

@GenerateMocks([DateTimeFactory])
void main() {
  late MockDateTimeFactory dateTimeFactory;
  late FindTodaysTask findTodaysTask;

  setUp(() {
    dateTimeFactory = MockDateTimeFactory();
    findTodaysTask = FindTodaysTask(dateTimeFactory);
  });

  final today = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
  final later = DateFormat('yyyy-MM-dd HH:mm')
      .format(DateTime.now().add(const Duration(days: 2)));

  final tTasks = [
    TaskEntity(
      id: 0,
      name: 'test',
      description: 'another test',
      date: today,
      isDone: false,
    ),
    TaskEntity(
      id: 1,
      name: 'test1',
      description: 'another test 1',
      date: later,
      isDone: false,
    ),
    TaskEntity(
      id: 2,
      name: 'test2',
      description: 'another test 2',
      date: today,
      isDone: false,
    ),
    TaskEntity(
      id: 3,
      name: 'test3',
      description: 'another test 3',
      date: later,
      isDone: false,
    ),
  ];

  final tTasksNoToday = [
    TaskEntity(
      id: 0,
      name: 'test',
      description: 'another test',
      date: later,
      isDone: false,
    ),
    TaskEntity(
      id: 1,
      name: 'test1',
      description: 'another test 1',
      date: later,
      isDone: false,
    ),
    TaskEntity(
      id: 2,
      name: 'test2',
      description: 'another test 2',
      date: later,
      isDone: false,
    ),
    TaskEntity(
      id: 3,
      name: 'test3',
      description: 'another test 3',
      date: later,
      isDone: false,
    ),
  ];

  final tTodayTasks = [
    TaskEntity(
      id: 0,
      name: 'test',
      description: 'another test',
      date: today,
      isDone: false,
    ),
    TaskEntity(
      id: 2,
      name: 'test2',
      description: 'another test 2',
      date: today,
      isDone: false,
    ),
  ];

  test(
    'same date',
    () {
      final DateTime date = DateTime.now().add(const Duration(hours: 1));
      expect(date.isSameDate(DateTime.now()), true);
    },
  );

  test(
    'Should return today\'s tasks',
    () {
      when(dateTimeFactory.stringToDateTime(today))
          .thenReturn(DateTime.parse(today));

      when(dateTimeFactory.stringToDateTime(later))
          .thenReturn(DateTime.parse(later));

      final res = findTodaysTask(tTasks);
      expect(
        res,
        equals(tTodayTasks),
      );
    },
  );

  test(
    'Should return [] when there is no today tasks',
    () {
      when(dateTimeFactory.stringToDateTime(today))
          .thenReturn(DateTime.parse(today));

      when(dateTimeFactory.stringToDateTime(later))
          .thenReturn(DateTime.parse(later));

      final res = findTodaysTask(tTasksNoToday);
      expect(
        res,
        [],
      );
    },
  );

  test(
    'Should return [] when the all the task is empty',
    () {
      final res = findTodaysTask([]);
      expect(
        res,
        [],
      );
    },
  );
}
