import 'package:get_it/get_it.dart';

import 'core/helpers/datetime_factory.dart';
import 'core/services/db.dart';
import 'features/task/data/data_sources/local_data_sources.dart';
import 'features/task/data/repository/task_repository_imp.dart';
import 'features/task/domain/repository/task_repository.dart';
import 'features/task/domain/usecases/create_task.dart';
import 'features/task/domain/usecases/find_tasks.dart';
import 'features/task/domain/usecases/find_todays_tasks.dart';
import 'features/task/presentation/bloc/task_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  usecase();
  repository();
  dataSource();
  bloc();
  external();
}

void usecase() {
  getIt.registerLazySingleton(
    () => FindTasks(
      getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => FindTodaysTask(
      getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => CreateTaskUseCase(
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
      findTodaysTask: getIt(),
      createTask: getIt(),
    ),
  );
}

void external() {
  getIt.registerLazySingleton<DbService>(() => DbServiceImp());
  getIt.registerLazySingleton<DateTimeFactory>(() => DateTimeFactoryImp());
}
