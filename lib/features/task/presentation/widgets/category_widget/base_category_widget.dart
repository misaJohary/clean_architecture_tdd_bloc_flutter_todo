import 'package:flutter/material.dart';

import '../../../../../core/theme/theme.dart';

class BaseCategoryWidget extends StatelessWidget {
  const BaseCategoryWidget({
    Key? key,
    required this.name,
    required this.isChecked,
  }) : super(key: key);

  final String name;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
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
                name,
                style: isChecked
                    ? Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white)
                    : Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
