import 'package:get_it/get_it.dart';

import 'features/task/data/data_sources/local_data_sources.dart';
import 'features/task/data/repository/task_repository_imp.dart';
import 'features/task/domain/repository/task_repository.dart';
import 'features/task/domain/usecases/find_tasks.dart';
import 'features/task/presentation/bloc/task_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {}

void usecase() {
  getIt.registerLazySingleton(
    () => FindTasks(
      getIt(),
    ),
  );
}

void repository() {
  getIt.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImp(
      getIt(),
    ),
  );
}

void dataSource() {
  getIt.registerLazySingleton<TaskLocalDataSources>(
    () => TaskLocalDataSourcesImp(
      db: getIt(),
    ),
  );
}

void bloc() {
  getIt.registerFactory<TaskBloc>(
    () => TaskBloc(
      findTasks: getIt(),
    ),
  );
}
