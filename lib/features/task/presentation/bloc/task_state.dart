part of 'task_bloc.dart';

enum TaskStatus { loading, success, failure }

enum CategoryType { all, today, unfinished }

class TaskState extends Equatable {
  const TaskState({
    this.status,
    required this.tasks,
    required this.todayTasks,
    required this.todayAndFutureTasks,
    this.failure,
    this.updateButtonController,
    required this.categorySelected,
    required this.categories,
    this.drawerController,
  });

  final TaskStatus? status;
  final List<TaskEntity> tasks;
  final List<TaskEntity> todayTasks;
  final List<TaskEntity> todayAndFutureTasks;
  final Failure? failure;
  final RoundedLoadingButtonController? updateButtonController;
  final CategoryType categorySelected;
  final List<Category> categories;
  final ZoomDrawerController? drawerController;

  TaskState copyWith({
    TaskStatus? status,
    List<TaskEntity>? tasks,
    Failure? failure,
    List<TaskEntity>? todayTasks,
    List<TaskEntity>? todayAndFutureTasks,
    RoundedLoadingButtonController? updateButtonController,
    CategoryType? categorySelected,
    List<Category>? categories,
    ZoomDrawerController? drawerController,
  }) =>
      TaskState(
        status: status ?? this.status,
        tasks: tasks ?? this.tasks,
        todayTasks: todayTasks ?? this.todayTasks,
        todayAndFutureTasks: todayAndFutureTasks ?? this.todayAndFutureTasks,
        failure: failure ?? this.failure,
        updateButtonController:
            updateButtonController ?? this.updateButtonController,
        categorySelected: categorySelected ?? this.categorySelected,
        categories: categories ?? this.categories,
        drawerController: drawerController ?? this.drawerController,
      );

  @override
  List<Object?> get props => [
        status,
        tasks,
        todayTasks,
        failure,
        updateButtonController,
        todayAndFutureTasks,
        categorySelected,
        categories,
        drawerController,
      ];
}

class TaskInitial extends TaskState {
  TaskInitial({
    super.status = TaskStatus.loading,
    super.tasks = const [],
    super.todayTasks = const [],
    super.todayAndFutureTasks = const [],
    super.categorySelected = CategoryType.all,
  }) : super(
            updateButtonController: RoundedLoadingButtonController(),
            drawerController: ZoomDrawerController(),
            categories: const [
              Category(
                name: 'All',
                type: CategoryType.all,
                isChecked: true,
                numberTasks: 0,
                numberDone: 0,
              ),
              Category(
                name: 'Today',
                type: CategoryType.today,
                isChecked: false,
                numberTasks: 0,
                numberDone: 0,
              ),
              Category(
                name: 'Unfinished',
                type: CategoryType.unfinished,
                isChecked: false,
                numberTasks: 0,
                numberDone: 0,
              ),
            ]);
}
