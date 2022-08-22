import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/drawer/app_drawer.dart';
import '../../../../core/widgets/drawer_widget.dart';
import '../bloc/task_bloc.dart';
import '../widgets/widgets.dart';

class AllTaskPage extends StatelessWidget {
  const AllTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
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
