import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/task_entity.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/find_tasks.dart';
import '../../domain/usecases/find_todays_tasks.dart';
import '../../domain/usecases/update_task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FindTasks findTasks;
  final FindTodaysTask findTodaysTask;
  // final CreateTaskUseCase createTask;
  final UpdateTaskUsecase updateTask;
  final DeleteTask deleteTask;
  TaskBloc({
    required this.findTasks,
    required this.findTodaysTask,
    // required this.createTask,
    required this.updateTask,
    required this.deleteTask,
  }) : super(TaskInitial()) {
    on<OnFindTasks>(_onFindTasks);
    on<OnFindTodayTasks>(_onFindTodayTasks);
    // on<OnCreateTask>(_onCreateTask);
    on<UpdateTask>(_onUpdateTask);
    on<OnDeleteTask>(_onDeleteTask);
    on<SwitchMarkTask>(_onSwitchMarkTask);
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

  void _onUpdateTask(
    UpdateTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(
      status: TaskStatus.loading,
    ));
    final res = await updateTask(UpdateTaskParam(event.task));
    state.updateButtonController.stop();

    res.fold(
        (failure) =>
            emit(state.copyWith(status: TaskStatus.failure, failure: failure)),
        (task) {
      final id =
          state.tasks.indexWhere((element) => element.id == event.task.id);
      return emit(
        state.copyWith(
          status: TaskStatus.success,
          tasks: List.of(state.tasks)
            ..removeAt(id)
            ..insert(id, task),
        ),
      );
    });
  }

  void _onSwitchMarkTask(
    SwitchMarkTask event,
    Emitter<TaskState> emit,
  ) {
    add(
      UpdateTask(
        TaskEntity.switchMarkDone(event.task),
      ),
    );
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
      return emit(
        state.copyWith(
          status: TaskStatus.success,
          tasks: List.of(state.tasks)..removeAt(id),
        ),
      );
    });
  }
}
