part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class OnFindTasks extends TaskEvent {}

class OnFindTodayTasks extends TaskEvent {}

class OnDeleteTask extends TaskEvent {
  final TaskEntity task;

  const OnDeleteTask(this.task);
  @override
  List<Object> get props => [task];
}

class OnFindTodayAndFutureTasks extends TaskEvent {}

class OnUpdateTasks extends TaskEvent {}

class OnChangeCategory extends TaskEvent {
  final CategoryType categoryType;

  const OnChangeCategory(this.categoryType);

  @override
  List<Object> get props => [categoryType];
}

class OnUpdateCategoryLength extends TaskEvent {}
