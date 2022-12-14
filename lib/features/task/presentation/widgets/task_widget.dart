import 'dart:ui';

import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/helpers/string_extension.dart';
import '../../../../core/theme/theme.dart';
import '../../../create_new_task/presentation/bloc/new_task_bloc.dart';
import '../../domain/entity/task_entity.dart';
import '../bloc/task_bloc.dart';
import '../../../create_new_task/presentation/widgets/update_task_widget.dart';

class TaskWidget extends StatelessWidget {
  final TaskEntity task;
  const TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text(
        //   DateFormat('HH:mm').format((task.date).toDateTime()),
        //   style: Theme.of(context)
        //       .textTheme
        //       .bodyText1!
        //       .copyWith(color: Colors.grey[700]),
        // ),
        // SizedBox(
        //   width: 8,
        // ),
        Expanded(
          child: CircularMenu(
            startingAngleInRadian: 2.61799,
            endingAngleInRadian: 4.71239,
            toggleButtonColor: Colors.white,
            toggleButtonIconColor: Theme.of(context).colorScheme.onSecondary,
            items: [
              CircularMenuItem(
                  icon: Icons.edit,
                  color: Colors.blueGrey,
                  iconSize: 15,
                  onTap: () {
                    context.read<NewTaskBloc>().add(OnInitializeTask(task));
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          scrollable: true,
                          content: Stack(
                            children: [
                              UpdateTaskWidget(task: task),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  padding: 5),
              CircularMenuItem(
                icon: Icons.delete_rounded,
                color: Colors.redAccent,
                iconSize: 15,
                onTap: () {
                  context.read<TaskBloc>().add(OnDeleteTask(task));
                },
                padding: 5,
              ),
              CircularMenuItem(
                icon: Icons.check,
                color: Colors.greenAccent,
                iconSize: 15,
                onTap: () {
                  context.read<NewTaskBloc>().add(
                        OnSwitchMarkTask(
                          task: task,
                        ),
                      );
                  context.read<TaskBloc>().add(OnFindTasks());
                },
                padding: 5,
              ),
            ],
            radius: 40,
            alignment: Alignment.topRight,
            toggleButtonSize: 18,
            toggleButtonAnimatedIconData: AnimatedIcons.menu_close,
            backgroundWidget: Card(
              surfaceTintColor: light,
              child: ListTile(
                leading: task.isDone
                    ? IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.check_circle_outline_rounded,
                            color: Theme.of(context).iconTheme.color),
                      )
                    : IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.circle_outlined,
                            color: Theme.of(context).iconTheme.color),
                      ),
                title: Text(
                  task.description,
                ),
                subtitle: Text(
                  DateFormat('HH : mm').format(
                    (task.date).toDateTime(),
                  ),
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
