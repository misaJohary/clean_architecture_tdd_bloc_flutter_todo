import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/task_model.dart';
import '../../domain/entity/task_entity.dart';
import '../../domain/usecases/create_task.dart';
import '../../domain/usecases/find_tasks.dart';
import '../../domain/usecases/find_todays_tasks.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FindTasks findTasks;
  final FindTodaysTask findTodaysTask;
  final CreateTaskUseCase createTask;
  TaskBloc(
      {required this.findTasks,
      required this.findTodaysTask,
      required this.createTask})
      : super(const TaskInitial()) {
    on<OnFindTasks>(_onFindTasks);
    on<OnFindTodayTasks>(_onFindTodayTasks);
    on<OnCreateTask>(_onCreateTask);
  }

  void _onFindTasks(
    OnFindTasks event,
    Emitter<TaskState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TaskStatus.loading,
      ),
    );
    final res = await findTasks(NoParams());

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

  void _onCreateTask(
    OnCreateTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(
      status: TaskStatus.loading,
    ));
    final res = await createTask(AddTaskParam(event.task));

    res.fold(
        (failure) =>
            emit(state.copyWith(status: TaskStatus.failure, failure: failure)),
        (task) => emit(state.copyWith(
            status: TaskStatus.success,
            tasks: List.of(state.tasks)..add(task))));
  }
}
