part of 'change_language_cubit.dart';

class ChangeLanguageState extends Equatable {
  const ChangeLanguageState(
      {required this.supportedLanguage, required this.currentLocale});
  final List<Locale> supportedLanguage;
  final Locale currentLocale;

  @override
  List<Object> get props => [supportedLanguage, currentLocale];
}

// final class ChangeLanguageInitial extends ChangeLanguageState {}
