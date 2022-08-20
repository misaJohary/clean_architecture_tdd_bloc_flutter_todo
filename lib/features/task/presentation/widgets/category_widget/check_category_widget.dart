import 'package:flutter/material.dart';

import 'base_category_widget.dart';

class CheckedCategoryWidget extends StatelessWidget {
  const CheckedCategoryWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return BaseCategoryWidget(
      name: name,
      isChecked: true,
    );
  }
}
