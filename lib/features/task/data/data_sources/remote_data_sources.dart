import 'dart:convert';

import '../../../../core/base_repository/base_repository.dart';
import '../../../../core/error/exception.dart';
import '../model/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> findTasks();
}

class TaskRemoteDataSourceImp implements TaskRemoteDataSource {
  final BaseRepository _baseRepository;

  TaskRemoteDataSourceImp(this._baseRepository);

  @override
  Future<List<TaskModel>> findTasks() async {
    final res = await _baseRepository.get('https://test.com');

    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => TaskModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
