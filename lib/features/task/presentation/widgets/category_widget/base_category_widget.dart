import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
    // final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
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
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: PieChart(
              chartRadius: 50,
              ringStrokeWidth: 5,
              centerText:
                  '${(category.numberDone / category.numberTasks * 100).toStringAsFixed(1)}%',
              dataMap: {'done': category.numberDone.toDouble()},
              centerTextStyle: TextStyle(
                  color: isChecked ? Colors.grey : strong, fontSize: 12),
              chartType: ChartType.ring,
              baseChartColor: isChecked ? Colors.white : light,
              chartValuesOptions: const ChartValuesOptions(
                showChartValues: false,
                showChartValueBackground: false,
              ),
              totalValue: category.numberTasks.toDouble(),
              chartLegendSpacing: 30,
            ),
          ),
        )
      ]),
    );
  }
}
