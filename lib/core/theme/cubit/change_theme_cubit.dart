import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeState(theme: ThemeData.light()));

  void toggleTheme() {
    if (state.theme == ThemeData.light()) {
      final ThemeData updateTheme = ThemeData.dark();
      emit(ChangeThemeState(theme: updateTheme));
    } else {
      final ThemeData updateTheme = ThemeData.light();
      emit(ChangeThemeState(theme: updateTheme));
    }
  }
}
