import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/helpers/datetime_factory.dart';
import '../../../../core/helpers/string_extension.dart';
import '../../../create_new_task/presentation/bloc/new_task_bloc.dart';
import '../../domain/entity/category.dart';
import '../../domain/entity/task_entity.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/find_tasks.dart';
import '../../domain/usecases/find_todays_tasks.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FindTasks findTasks;
  final FindTodaysTask findTodaysTask;
  final DeleteTask deleteTask;
  TaskBloc({
    required this.findTasks,
    required this.findTodaysTask,
    required this.deleteTask,
  }) : super(TaskInitial()) {
    on<OnFindTasks>(_onFindTasks);
    on<OnFindTodayTasks>(_onFindTodayTasks);
    on<OnDeleteTask>(_onDeleteTask);
    on<OnFindTodayAndFutureTasks>(_onFindTodayAndFutureTasks);
    on<OnUpdateTasks>(_onUpdateTasks);
    on<OnChangeCategory>(_onChangeCategory);
    on<OnUpdateCategoryLength>(_onUpdateCategoryLenght);
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
      (tasks) {
        emit(
          state.copyWith(status: TaskStatus.success, tasks: tasks),
        );
        add(OnUpdateTasks());
      },
    );
  }

  void _onFindTodayTasks(
    OnFindTodayTasks event,
    Emitter<TaskState> emit,
  ) {
    final todays = findTodaysTask(state.tasks);
    emit(state.copyWith(todayTasks: todays));
  }

  void _onDeleteTask(
    OnDeleteTask event,
    Emitter<TaskState> emit,
  ) async {
    // emit(state.copyWith(
    //   status: TaskStatus.loading,
    // ));

    final res = await deleteTask(DeleteTaskParam(event.task));

    res.fold(
        (failure) =>
            emit(state.copyWith(status: TaskStatus.failure, failure: failure)),
        (task) {
      final id =
          state.tasks.indexWhere((element) => element.id == event.task.id);
      emit(
        state.copyWith(
          status: TaskStatus.success,
          tasks: List.of(state.tasks)..removeAt(id),
        ),
      );
      add(OnUpdateTasks());
    });
  }

  void _onFindTodayAndFutureTasks(
    OnFindTodayAndFutureTasks event,
    Emitter<TaskState> emit,
  ) {
    if (state.tasks.isNotEmpty) {
      final todayAndFutureTasks = state.tasks
          .where((task) =>
              DateTime.now().isBefore((task.date).toDateTime()) ||
              DateTime.now().isSameDate((task.date).toDateTime()))
          .toList();

      todayAndFutureTasks.sort((a, b) => a.date.compareTo(b.date));

      emit(
        state.copyWith(
          todayAndFutureTasks: todayAndFutureTasks,
        ),
      );
    }
  }

  void _onChangeCategory(
    OnChangeCategory event,
    Emitter<TaskState> emit,
  ) {
    final categories = state.categories.map((category) {
      if (category.type == event.categoryType) {
        return category.copyWith(isChecked: true);
      }
      return category.copyWith(isChecked: false);
    }).toList();
    emit(state.copyWith(
        categorySelected: event.categoryType, categories: categories));
  }

  void _onUpdateCategoryLenght(
    OnUpdateCategoryLength event,
    Emitter<TaskState> emit,
  ) {
    // for (int i = 0; i < state.categories.length; i++){
    //   switch (state.categories[i].type) {
    //     case CategoryType.all:
    //       state.todayAndFutureTasks.map((task) {
    //           if (task.isDone == true) {
    //             finishTasks++;
    //           }
    //         });
    //         return category.copyWith(
    //           numberTasks: state.todayAndFutureTasks.length,
    //           numberDone: finishTasks,
    //         );
    //       // break;
    //     default:
    //   }
    // }
    final categories = state.categories.map((category) {
      int finishTasks = 0;
      switch (category.type) {
        case CategoryType.all:
          for (int i = 0; i < state.todayAndFutureTasks.length; i++) {
            if (state.todayAndFutureTasks[i].isDone == true) {
              finishTasks++;
            }
          }
          return category.copyWith(
            numberTasks: state.todayAndFutureTasks.length,
            numberDone: finishTasks,
          );

        case CategoryType.today:
          for (int i = 0; i < state.todayTasks.length; i++) {
            if (state.todayTasks[i].isDone == true) {
              finishTasks++;
            }
          }

          return category.copyWith(
            numberTasks: state.todayTasks.length,
            numberDone: finishTasks,
          );

        default:
          return category;
      }
    }).toList();
    emit(state.copyWith(categories: categories));
  }

  void _onUpdateTasks(
    OnUpdateTasks event,
    Emitter<TaskState> emit,
  ) {
    add(OnFindTodayAndFutureTasks());
    add(OnFindTodayTasks());
    add(OnUpdateCategoryLength());
  }
}
