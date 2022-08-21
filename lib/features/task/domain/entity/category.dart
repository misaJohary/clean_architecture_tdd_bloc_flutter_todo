import 'package:equatable/equatable.dart';

import '../../presentation/bloc/task_bloc.dart';

class Category extends Equatable {
  final String name;
  final CategoryType type;
  final bool isChecked;
  final int numberTasks;
  final int numberDone;

  const Category({
    required this.name,
    required this.type,
    required this.isChecked,
    required this.numberTasks,
    required this.numberDone,
  });
  Category copyWith({int? numberTasks, bool? isChecked, int? numberDone}) =>
      Category(
        name: name,
        type: type,
        isChecked: isChecked ?? this.isChecked,
        numberTasks: numberTasks ?? this.numberTasks,
        numberDone: numberDone ?? this.numberDone,
      );

  @override
  List<Object?> get props => [
        name,
        type,
        isChecked,
        numberTasks,
        numberDone,
      ];
}
