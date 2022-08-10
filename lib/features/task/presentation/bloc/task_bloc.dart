import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/task_entity.dart';
import '../../domain/usecases/find_tasks.dart';
import '../../domain/usecases/find_todays_tasks.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FindTasks findTasks;
  final FindTodaysTask findTodaysTask;
  TaskBloc({required this.findTasks, required this.findTodaysTask})
      : super(TaskInitial()) {
    on<OnFindTasks>(_onFindTasks);
    on<OnFindTodayTasks>(_onFindTodayTasks);
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
}
