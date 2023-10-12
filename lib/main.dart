import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/core/constants/cubit/cubit_provider.dart';
import 'package:todo/core/language/cubit/change_language_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/core/theme/cubit/change_theme_cubit.dart';
import 'package:todo/representation/screen/start_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: cubitProvider,
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, stateTheme) {
          return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
            builder: (context, stateLang) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: stateTheme.theme,
                home: const StartScreen(),
                locale: stateLang.currentLocale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: stateLang.supportedLanguage,
              );
            },
          );
        },
      ),
    );
  }
}
