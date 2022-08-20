import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:my_todo_clean/features/task/presentation/widgets/task_skeleton_widget.dart';
import 'package:my_todo_clean/features/task/presentation/widgets/task_widget.dart';

import '../../../../core/helpers/datetime_factory.dart';
import '../../../../core/helpers/string_extension.dart';
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
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: GroupedListView(
                elements: state.todayAndFutureTasks,
                groupBy: (TaskEntity task) => (task.date).toDateTimeDateOnly(),
                groupSeparatorBuilder: (DateTime group) {
                  String header;
                  if (group.isSameDate(DateTime.now())) {
                    header = 'Today';
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
                          .copyWith(color: Color(0xFFf79489), fontSize: 18),
                    ),
                  );
                },
                itemBuilder: (context, TaskEntity task) =>
                    TaskWidget(task: task),
              ),
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