import 'package:get_it/get_it.dart';

import 'core/helpers/datetime_factory.dart';
import 'core/services/db.dart';
import 'features/create_new_task/data/data_sources/local_data_sources.dart';
import 'features/create_new_task/data/repository/create_new_task_repository.dart';
import 'features/create_new_task/domain/reporitory/new_task_repository.dart';
import 'features/create_new_task/domain/usecases/create_task_usecase.dart';
import 'features/create_new_task/presentation/bloc/new_task_bloc.dart';
import 'features/task/data/data_sources/local_data_sources.dart';
import 'features/task/data/repository/task_repository_imp.dart';
import 'features/task/domain/repository/task_repository.dart';
import 'features/task/domain/usecases/delete_task.dart';
import 'features/task/domain/usecases/find_tasks.dart';
import 'features/task/domain/usecases/find_todays_tasks.dart';
import 'features/create_new_task/domain/usecases/update_task.dart';
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

  getIt.registerLazySingleton(
    () => UpdateTaskUsecase(getIt()),
  );

  getIt.registerLazySingleton(
    () => DeleteTask(
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

  getIt.registerLazySingleton<NewTaskRepository>(
    () => NewTaskRepositoryImp(
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

  getIt.registerLazySingleton<NewTaskLocalDataSources>(
    () => NewTaskLocalDataSourcesImp(
      db: getIt(),
    ),
  );
}

void bloc() {
  getIt.registerFactory<TaskBloc>(
    () => TaskBloc(
      findTasks: getIt(),
      findTodaysTask: getIt(),
      deleteTask: getIt(),
    ),
  );

  getIt.registerFactory<NewTaskBloc>(
    () => NewTaskBloc(
      createTask: getIt(),
      updateTask: getIt(),
    ),
  );
}

void external() {
  getIt.registerLazySingleton<DbService>(() => DbServiceImp());
  getIt.registerLazySingleton<DateTimeFactory>(() => DateTimeFactoryImp());
}
