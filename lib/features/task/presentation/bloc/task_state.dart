part of 'task_bloc.dart';

enum TaskStatus { loading, success, failure }

class TaskState extends Equatable {
  const TaskState({
    required this.status,
    required this.tasks,
    required this.todayTasks,
    required this.todayAndFutureTasks,
    this.failure,
    this.updateButtonController,
  });

  final TaskStatus status;
  final List<TaskEntity> tasks;
  final List<TaskEntity> todayTasks;
  final List<TaskEntity> todayAndFutureTasks;
  final Failure? failure;
  final RoundedLoadingButtonController? updateButtonController;

  TaskState copyWith({
    TaskStatus? status,
    List<TaskEntity>? tasks,
    Failure? failure,
    List<TaskEntity>? todayTasks,
    List<TaskEntity>? todayAndFutureTasks,
    RoundedLoadingButtonController? updateButtonController,
  }) =>
      TaskState(
        status: status ?? this.status,
        tasks: tasks ?? this.tasks,
        todayTasks: todayTasks ?? this.todayTasks,
        todayAndFutureTasks: todayAndFutureTasks ?? this.todayAndFutureTasks,
        failure: failure ?? this.failure,
        updateButtonController:
            updateButtonController ?? this.updateButtonController,
      );

  @override
  List<Object?> get props => [
        status,
        tasks,
        todayTasks,
        failure,
        updateButtonController,
        todayAndFutureTasks,
      ];
}

class TaskInitial extends TaskState {
  TaskInitial({
    super.status = TaskStatus.loading,
    super.tasks = const [],
    super.todayTasks = const [],
    super.todayAndFutureTasks = const [],
  }) : super(
          updateButtonController: RoundedLoadingButtonController(),
        );
  // : super(
  //     status: TaskStatus.loading,
  //     tasks: [],
  //     todayTasks: [],
  //   );
}
