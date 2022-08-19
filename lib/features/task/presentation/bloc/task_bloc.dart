import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/helpers/datetime_factory.dart';
import '../../domain/entity/task_entity.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/find_tasks.dart';
import '../../domain/usecases/find_todays_tasks.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FindTasks findTasks;
  final FindTodaysTask findTodaysTask;
  final DeleteTask deleteTask;
  TaskBloc({
    required this.findTasks,
    required this.findTodaysTask,
    required this.deleteTask,
  }) : super(TaskInitial()) {
    on<OnFindTasks>(_onFindTasks);
    on<OnFindTodayTasks>(_onFindTodayTasks);
    on<OnDeleteTask>(_onDeleteTask);
    on<OnFindTodayAndFutureTasks>(_onFindTodayAndFutureTasks);
  }

  void _onFindTasks(
    OnFindTasks event,
    Emitter<TaskState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TaskStatus.loading,
        tasks: [],
      ),
    );
    final res = await findTasks(NoParams());
    add(OnFindTodayAndFutureTasks());
    add(OnFindTodayTasks());

    res.fold(
      (failure) => emit(
        state.copyWith(status: TaskStatus.failure, failure: failure),
      ),
      (tasks) => emit(
        state.copyWith(status: TaskStatus.success, tasks: tasks),
      ),
    );
  }

  void _onFindTodayTasks(
    OnFindTodayTasks event,
    Emitter<TaskState> emit,
  ) {
    emit(state.copyWith(
      status: TaskStatus.loading,
    ));
    final todays = findTodaysTask(state.tasks);
    emit(state.copyWith(status: TaskStatus.success, todayTasks: todays));
  }

  void _onDeleteTask(
    OnDeleteTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(
      status: TaskStatus.loading,
    ));

    final res = await deleteTask(DeleteTaskParam(event.task));

    res.fold(
        (failure) =>
            emit(state.copyWith(status: TaskStatus.failure, failure: failure)),
        (task) {
      final id =
          state.tasks.indexWhere((element) => element.id == event.task.id);
      emit(
        state.copyWith(
          status: TaskStatus.success,
          tasks: List.of(state.tasks)..removeAt(id),
        ),
      );
      add(OnFindTodayAndFutureTasks());
    });
  }

  void _onFindTodayAndFutureTasks(
    OnFindTodayAndFutureTasks event,
    Emitter<TaskState> emit,
  ) {
    if (state.tasks.isNotEmpty) {
      emit(state.copyWith(status: TaskStatus.loading));
      final todayAndFutureTasks = state.tasks
          .where((task) =>
              DateTime.now()
                  .isBefore(DateTimeFactoryImp().stringToDateTime(task.date)) ||
              DateTime.now()
                  .isSameDate(DateTimeFactoryImp().stringToDateTime(task.date)))
          .toList();

      todayAndFutureTasks.sort((a, b) => a.date.compareTo(b.date));
      emit(
        state.copyWith(
          todayAndFutureTasks: todayAndFutureTasks,
          status: TaskStatus.success,
        ),
      );
    }
  }
}
