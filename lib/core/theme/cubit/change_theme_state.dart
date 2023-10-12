part of 'change_theme_cubit.dart';

class ChangeThemeState extends Equatable {
  final ThemeData theme;
  ChangeThemeState({required this.theme});
  @override
  List<Object> get props => [theme];
}

// final class ChangeThemeInitial extends ChangeThemeState {}
