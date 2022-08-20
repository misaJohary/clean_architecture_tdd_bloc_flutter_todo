part of 'new_task_bloc.dart';

abstract class NewTaskEvent extends Equatable {
  const NewTaskEvent();

  @override
  List<Object?> get props => [];
}

class OnCreateTask extends NewTaskEvent {
  final TaskModel task;
  final BuildContext context;

  const OnCreateTask({
    required this.context,
    required this.task,
  });

  @override
  List<Object> get props => [task, context];
}

class OnTaskTitleChanged extends NewTaskEvent {
  const OnTaskTitleChanged(this.title);

  final String title;

  @override
  List<Object> get props => [title];
}

class OnTaskDescriptionChanged extends NewTaskEvent {
  const OnTaskDescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class OnVerifyNewTask extends NewTaskEvent {
  @override
  List<Object> get props => [];
}

class OnAddNewTask extends NewTaskEvent {
  final BuildContext context;

  const OnAddNewTask(this.context);

  @override
  List<Object> get props => [context];
}

class OnDateSelected extends NewTaskEvent {
  final BuildContext context;

  const OnDateSelected(this.context);

  @override
  List<Object> get props => [context];
}

class OnTimeSelected extends NewTaskEvent {
  final BuildContext context;

  const OnTimeSelected(this.context);

  @override
  List<Object> get props => [context];
}

class OnInitializeTask extends NewTaskEvent {
  final TaskEntity task;

  const OnInitializeTask(this.task);

  @override
  List<Object> get props => [task];
}

class OnUpdateTask extends NewTaskEvent {
  final TaskEntity task;
  final BuildContext? context;

  const OnUpdateTask({
    this.context,
    required this.task,
  });

  @override
  List<Object?> get props => [
        task,
        context,
      ];
}

class OnSwitchMarkTask extends NewTaskEvent {
  final TaskEntity task;
  final BuildContext context;

  const OnSwitchMarkTask({
    required this.context,
    required this.task,
  });

  @override
  List<Object> get props => [
        task,
        context,
      ];
}
