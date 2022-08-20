import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/routes/app_routes.dart';
import 'core/services/l10n/l10n.dart';
import 'core/theme/bloc/theme_bloc.dart';
import 'core/theme/theme.dart';
import 'dependency_injection.dart';

import 'features/create_new_task/presentation/bloc/new_task_bloc.dart';
import 'features/task/presentation/bloc/task_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<TaskBloc>()
            ..add(
              OnFindTasks(),
            )
            ..add(
              OnFindTodayAndFutureTasks(),
            ),
        ),
        BlocProvider(
          create: (_) => getIt<NewTaskBloc>(),
        ),
        BlocProvider(
          create: (_) => ThemeBloc(),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'To do',
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routes: AppRoute.routes,
          );
        },
      ),
    );
  }
}
