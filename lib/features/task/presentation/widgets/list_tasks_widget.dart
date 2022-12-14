import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../create_new_task/presentation/bloc/new_task_bloc.dart';
import 'task_skeleton_widget.dart';
import 'task_widget.dart';

import '../../../../core/helpers/datetime_factory.dart';
import '../../../../core/helpers/string_extension.dart';
import '../../../../core/theme/theme.dart';
import '../../domain/entity/task_entity.dart';
import '../bloc/task_bloc.dart';

class ListTasksWidget extends StatelessWidget {
  const ListTasksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
        switch (state.status) {
          case TaskStatus.failure:
            return Center(
              child: Text(state.failure!.message!),
            );

          case TaskStatus.success:
            return BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                List<TaskEntity> taskToShow = [];

                switch (state.categorySelected) {
                  case CategoryType.all:
                    taskToShow = state.todayAndFutureTasks;
                    break;
                  case CategoryType.today:
                    taskToShow = state.todayTasks;
                    break;
                  case CategoryType.unfinished:
                    taskToShow = state.todayTasks;
                    break;
                  default:
                    taskToShow = state.todayAndFutureTasks;
                }

                if (taskToShow.isEmpty) {
                  return Center(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoute.newTaskPage);
                      },
                      label: const Text('Add New Task now !'),
                      icon: const Icon(Icons.add),
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GroupedListView(
                    elements: taskToShow,
                    groupBy: (TaskEntity task) =>
                        (task.date).toDateTimeDateOnly(),
                    groupSeparatorBuilder: (DateTime group) {
                      String header;
                      if (group.isSameDate(DateTime.now())) {
                        header = 'Today,   ${group.toFormattedString()}';
                      } else {
                        header = group.toFormattedString();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          header,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 18),
                        ),
                      );
                    },
                    itemBuilder: (context, TaskEntity task) =>
                        TaskWidget(task: task),
                  ),
                );
              },
            );

          default:
            return ListView.builder(
              itemBuilder: ((context, index) => const TaskSkeletonWidget()),
              itemCount: 10,
            );
        }
      }),
    );
  }
}
