import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  const TaskEntity({
    this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.isDone,
  });
  final int? id;
  final String name;
  final String description;
  final String date;
  final bool isDone;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        date,
        isDone,
      ];

  factory TaskEntity.switchMarkDone(TaskEntity task) => TaskEntity(
        id: task.id,
        name: task.name,
        description: task.description,
        date: task.date,
        isDone: !task.isDone,
      );
}
