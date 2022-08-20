import 'package:flutter/material.dart';

import '../../../../../core/theme/theme.dart';
import '../../../domain/entity/category.dart';

class BaseCategoryWidget extends StatelessWidget {
  const BaseCategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  // final String name;
  // final bool isChecked;

  @override
  Widget build(BuildContext context) {
    final isChecked = category.isChecked;
    return Card(
      color: isChecked ? mColor : null,
      surfaceTintColor: isChecked ? mColor : Colors.white,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              isChecked
                  ? Icon(
                      isChecked
                          ? Icons.radio_button_checked_rounded
                          : Icons.circle_outlined,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.circle_outlined,
                    ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${category.name} (${category.numberTasks})',
                style: isChecked
                    ? Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white)
                    : Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total : ${category.numberTasks}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: isChecked ? Colors.white : strong),
              ),
              Text(
                'Done : ${category.numberTasks}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: isChecked ? Colors.white : strong),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
