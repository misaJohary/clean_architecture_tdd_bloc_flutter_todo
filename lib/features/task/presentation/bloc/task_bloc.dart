import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/task_model.dart';
import '../../domain/entity/task_entity.dart';
import '../../domain/usecases/create_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/find_tasks.dart';
import '../../domain/usecases/find_todays_tasks.dart';
import '../../domain/usecases/update_task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FindTasks findTasks;
  final FindTodaysTask findTodaysTask;
  final CreateTaskUseCase createTask;
  final UpdateTaskUsecase updateTask;
  final DeleteTask deleteTask;
  TaskBloc({
    required this.findTasks,
    required this.findTodaysTask,
    required this.createTask,
    required this.updateTask,
    required this.deleteTask,
  }) : super(const TaskInitial()) {
    on<OnFindTasks>(_onFindTasks);
    on<OnFindTodayTasks>(_onFindTodayTasks);
    on<OnCreateTask>(_onCreateTask);
    on<UpdateTask>(_onUpdateTask);
    on<OnDeleteTask>(_onDeleteTask);
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

  void _onUpdateTask(
    UpdateTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(
      status: TaskStatus.loading,
    ));
    final res = await updateTask(UpdateTaskParam(event.task));

    res.fold(
        (failure) =>
            emit(state.copyWith(status: TaskStatus.failure, failure: failure)),
        (task) {
      final id =
          state.tasks.firstWhere((element) => element.id == event.task.id).id;
      return emit(state.copyWith(
          status: TaskStatus.success,
          tasks: List.of(state.tasks)
            ..removeAt(id)
            ..insert(id, task)));
    });
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
          state.tasks.firstWhere((element) => element.id == event.task.id).id;
      return emit(state.copyWith(
          status: TaskStatus.success,
          tasks: List.of(state.tasks)..removeAt(id)));
    });
  }
}
