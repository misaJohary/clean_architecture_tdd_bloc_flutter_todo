part of 'task_bloc.dart';

enum TaskStatus { loading, success, failure }

class TaskState extends Equatable {
  const TaskState({
    required this.status,
    required this.tasks,
    required this.todayTasks,
    this.failure,
  });

  final TaskStatus status;
  final List<TaskEntity> tasks;
  final List<TaskEntity> todayTasks;
  final Failure? failure;

  TaskState copyWith({
    TaskStatus? status,
    List<TaskEntity>? tasks,
    Failure? failure,
    List<TaskEntity>? todayTasks,
  }) =>
      TaskState(
        status: status ?? this.status,
        tasks: tasks ?? this.tasks,
        todayTasks: todayTasks ?? this.todayTasks,
        failure: failure ?? this.failure,
      );

  @override
  List<Object?> get props => [
        status,
        tasks,
        todayTasks,
        failure,
      ];
}

class TaskInitial extends TaskState {
  const TaskInitial(
      {super.status = TaskStatus.loading,
      super.tasks = const [],
      super.todayTasks = const []});
  // : super(
  //     status: TaskStatus.loading,
  //     tasks: [],
  //     todayTasks: [],
  //   );
}
