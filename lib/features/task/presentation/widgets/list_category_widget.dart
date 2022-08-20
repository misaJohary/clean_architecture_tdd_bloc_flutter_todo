import 'package:flutter/material.dart';
import 'category_widget/category_widget.dart';

class ListCategoryWidget extends StatelessWidget {
  const ListCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryWidget(
            name: 'All',
            isChecked: true,
          ),
          CategoryWidget(
            name: 'Today',
            isChecked: false,
          ),
          CategoryWidget(
            name: 'Unfinished',
            isChecked: false,
          ),
        ],
      ),
    );
  }
}
