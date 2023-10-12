import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/language/cubit/change_language_cubit.dart';
import 'package:todo/core/theme/cubit/change_theme_cubit.dart';
import 'package:todo/todo/cubit/todo_cubit.dart';

final todoCubit = TodoCubit();
final changeLanguage = ChangeLanguageCubit();

final cubitProvider = [
  BlocProvider<TodoCubit>(create: (_) => todoCubit),
  BlocProvider<ChangeLanguageCubit>(create: (_) => ChangeLanguageCubit()),
  BlocProvider<ChangeThemeCubit>(create: (_) => ChangeThemeCubit()),
];
