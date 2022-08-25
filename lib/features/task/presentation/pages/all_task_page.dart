import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/pop_up/toast_message.dart';
import '../../../../core/widgets/drawer/app_drawer.dart';
import '../../../../core/widgets/drawer_widget.dart';
import '../../../create_new_task/presentation/bloc/new_task_bloc.dart';
import '../bloc/task_bloc.dart';
import '../widgets/widgets.dart';

class AllTaskPage extends StatelessWidget {
  const AllTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewTaskBloc, NewTaskState>(
      listener: (context, state) {
        switch (state.updateStatus) {
          case NewTaskStatus.success:
            successMessage(context, 'Task update successfully'
                // AppLocalizations.of(context)!.successCreatingNewTask,
                );
            break;

          case NewTaskStatus.failure:
            failureMessage(context, 'Error updating the new task'
                // AppLocalizations.of(context)!.errorCreatingNewTask,
                );
            break;
          default:
        }
      },
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return SafeArea(
            child: ZoomDrawer(
              controller: state.drawerController,
              menuScreen: const AppDrawer(),
              mainScreen: const Body(),
              borderRadius: 24.0,
              showShadow: true,
              menuBackgroundColor: Theme.of(context).backgroundColor,
              mainScreenTapClose: true,
              angle: 0.0,
              drawerShadowsBackgroundColor: Colors.grey[300]!,
              slideWidth: MediaQuery.of(context).size.width * 0.65,
            ),
          );
        },
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DrawerWidget(),
            HeadlineWidget(),
            Expanded(
              flex: 1,
              child: ListCategoryWidget(),
            ),
            Expanded(
              flex: 3,
              child: ListTasksWidget(),
            ),
          ],
        ),
        floatingActionButton: const AddFAB(),
      ),
    );
  }
}
