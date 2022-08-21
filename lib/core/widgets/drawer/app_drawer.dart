import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/bloc/theme_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Drawer(
          child: SwitchListTile(
              title: const Text('light theme'),
              value: state.themeMode == ThemeMode.light,
              onChanged: (value) {
                context.read<ThemeBloc>().add(SwitchThemeEvent());
              }),
        );
      },
    );
  }
}
