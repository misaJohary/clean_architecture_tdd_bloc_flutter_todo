import 'package:flutter/material.dart';

import '../../features/create_new_task/presentation/pages/new_task_page.dart';
import '../../features/task/presentation/pages/all_task_page.dart';

class AppRoute {
  static String home = '/';
  static String newTaskPage = 'new-task-page';

  static Map<String, WidgetBuilder> routes = {
    home: (BuildContext context) => const AllTaskPage(),
    newTaskPage: (BuildContext context) => const NewTask(),
  };
}
