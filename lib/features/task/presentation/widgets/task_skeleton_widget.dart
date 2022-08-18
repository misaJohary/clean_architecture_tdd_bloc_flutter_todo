import 'package:flutter/material.dart';

import '../../../../core/widgets/shimmer_widget.dart';

class TaskSkeletonWidget extends StatelessWidget {
  const TaskSkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: ShimmerWidget.circular(width: 18, height: 18),
      title: Align(
          alignment: Alignment.centerLeft,
          child: ShimmerWidget.rectangular(width: 80, height: 18)),
      subtitle: Align(
        alignment: Alignment.centerLeft,
        child: ShimmerWidget.rectangular(
          width: 200,
          height: 18,
        ),
      ),
    );
  }
}
