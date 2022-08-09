part of 'task_bloc.dart';

enum TaskStatus { loading, success, failure }

class TaskState extends Equatable {
  const TaskState({
    required this.status,
    this.tasks,
    this.failure,
  });

  final TaskStatus status;
  final List<TaskEntity>? tasks;
  final Failure? failure;

  TaskState copyWith(
          {TaskStatus? status, List<TaskEntity>? tasks, Failure? failure}) =>
      TaskState(
        status: status ?? this.status,
        tasks: tasks ?? this.tasks,
        failure: failure ?? this.failure,
      );

  @override
  List<Object?> get props => [
        status,
        tasks,
        failure,
      ];
}

class TaskInitial extends TaskState {
  const TaskInitial() : super(status: TaskStatus.loading);
}
