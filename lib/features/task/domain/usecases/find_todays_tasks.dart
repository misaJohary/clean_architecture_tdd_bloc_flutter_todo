import '../../../../core/helpers/datetime_factory.dart';
import '../../../../core/helpers/string_extension.dart';
import '../entity/task_entity.dart';

class FindTodaysTask {
  // final DateTimeFactory _dateTimeFactory;

  // FindTodaysTask(this._dateTimeFactory);

  List<TaskEntity> call(List<TaskEntity> allTasks) {
    final List<TaskEntity> todays = [];
    for (int i = 0; i < allTasks.length; i++) {
      if ((allTasks[i].date).toDateTime().isSameDate(DateTime.now())) {
        todays.add(allTasks[i]);
      }
    }
    return todays;
  }
}
