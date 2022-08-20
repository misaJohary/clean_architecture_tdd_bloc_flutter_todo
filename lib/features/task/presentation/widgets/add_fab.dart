import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';

class AddFAB extends StatelessWidget {
  const AddFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoute.newTaskPage);
      },
      child: const Icon(Icons.add),
    );
  }
}
