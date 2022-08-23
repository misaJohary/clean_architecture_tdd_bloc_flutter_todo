import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/task/presentation/bloc/task_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              state.drawerController?.open!();
            },
            icon: SvgPicture.asset(
              'assets/images/icon_drawer.svg',
              color: Theme.of(context).iconTheme.color,
            ),
          );
        },
      );
    });
  }
}
