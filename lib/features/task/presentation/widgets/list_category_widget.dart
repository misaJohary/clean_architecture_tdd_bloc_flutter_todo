import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task_bloc.dart';
import 'category_widget/category_widget.dart';

class ListCategoryWidget extends StatelessWidget {
  const ListCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.categories.length,
          itemBuilder: (context, index) =>
              CategoryWidget(category: state.categories[index]),
        ),
      ),
    );
  }
}
