import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/category.dart';
import '../../bloc/task_bloc.dart';
import 'category.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.category,
    // required this.isChecked,
  }) : super(
          key: key,
        );

  final Category category;
  // final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: InkWell(
        onTap: () {
          context.read<TaskBloc>().add(OnChangeCategory(category.type));
        },
        child: BaseCategoryWidget(category: category),
      ),
    );
  }
}
