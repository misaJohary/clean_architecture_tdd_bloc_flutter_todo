import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/app_routes.dart';
import '../bloc/task_bloc.dart';

import '../widgets/task_skeleton_widget.dart';
import '../widgets/task_widget.dart';

class AllTaskPage extends StatelessWidget {
  const AllTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
          switch (state.status) {
            case TaskStatus.failure:
              return Center(
                child: Text(state.failure!.message!),
              );

            case TaskStatus.success:
              return ListView.builder(
                itemBuilder: ((context, index) => TaskWidget(
                      task: state.tasks[index],
                    )),
                itemCount: state.tasks.length,
              );

            default:
              return ListView.builder(
                itemBuilder: ((context, index) => const TaskSkeletonWidget()),
                itemCount: 10,
              );
          }
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoute.newTaskPage);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
