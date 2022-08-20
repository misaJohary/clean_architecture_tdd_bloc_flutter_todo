import 'package:flutter/material.dart';

import '../../../../core/widgets/drawer_widget.dart';
import '../widgets/widgets.dart';

class AllTaskPage extends StatelessWidget {
  const AllTaskPage({Key? key}) : super(key: key);

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
