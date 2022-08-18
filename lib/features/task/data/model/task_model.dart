import 'package:dartz/dartz.dart';

import '../../domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    super.id,
    required super.name,
    required super.description,
    required super.date,
    required super.isDone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        date: json['date'],
        isDone: json['isDone'] == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': name,
        'description': description,
        'date': date,
        'isDone': isDone ? 1 : 0,
      };
}
