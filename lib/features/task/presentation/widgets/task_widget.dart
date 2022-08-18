import 'package:flutter/material.dart';
import '../../domain/entity/task_entity.dart';

class TaskWidget extends StatelessWidget {
  final TaskEntity task;
  const TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: ListTile(
        leading: task.isDone
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.check_circle_outline_rounded,
                ),
              )
            : IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.circle_outlined,
                ),
              ),
        title: Text(task.name),
        subtitle: Text(task.date),
      ),
    );
  }
}
