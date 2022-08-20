import 'package:flutter/material.dart';
import 'category.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.name,
    required this.isChecked,
  }) : super(
          key: key,
        );

  final String name;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: InkWell(
        onTap: () {},
        child: isChecked
            ? CheckedCategoryWidget(name: name)
            : UnCheckedCategoryWidget(name: name),
      ),
    );
  }
}
