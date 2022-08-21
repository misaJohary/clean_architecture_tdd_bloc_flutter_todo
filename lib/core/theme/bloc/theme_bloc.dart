import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.light)) {
    on<SwitchThemeEvent>(_onSwitchThemeEvent);
  }

  void _onSwitchThemeEvent(
    SwitchThemeEvent event,
    Emitter<ThemeState> emit,
  ) {
    if (state.themeMode == ThemeMode.light) {
      return emit(const ThemeState(themeMode: ThemeMode.dark));
    }
    return emit(const ThemeState(themeMode: ThemeMode.light));
  }
}
