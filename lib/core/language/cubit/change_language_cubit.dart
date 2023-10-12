import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  final List<Locale> supportedLang;
  ChangeLanguageCubit({this.supportedLang = const [Locale("en"), Locale("vi")]})
      : super(ChangeLanguageState(
            supportedLanguage: supportedLang,
            currentLocale: supportedLang.first));

  void changeLang() {
    if (state.currentLocale.languageCode == 'en') {
      emit(ChangeLanguageState(
          supportedLanguage: supportedLang, currentLocale: supportedLang.last));
    } else {
      emit(ChangeLanguageState(
          supportedLanguage: supportedLang,
          currentLocale: supportedLang.first));
    }
  }

  // void changeStartLang() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? langCode = prefs.getString('lang');
  //   print(langCode);
  //   if (langCode != null) {
  //     emit(Locale(langCode, ''));
  //   }
  // }

  // void changeLang(context, String data) async {
  //   emit(Locale(data, ''));
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('lang', data);
  // }
}
