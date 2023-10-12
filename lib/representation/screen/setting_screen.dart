import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slider_button/slider_button.dart';
import 'package:todo/core/constants/color_palette.dart';
import 'package:todo/core/constants/text_style.dart';
import 'package:todo/core/language/cubit/change_language_cubit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/core/theme/cubit/change_theme_cubit.dart';
import 'package:todo/route/router_const.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool light = false;
  bool changeLanguage = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      light = pref.getBool("changeTheme") ?? false;
      changeLanguage = pref.getBool("changeLanguage") ?? false;
    });
  }

  Future<void> _saveLight(bool value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("changeTheme", value);
  }

  Future<void> _saveLanguage(bool value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("changeLanguage", value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, stateTheme) {
        return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
          builder: (context, stateLang) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    AppLocalizations.of(context)!.settings,
                    style: CustomStyle.headingText(context),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        height: 82,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: ColorPalette.primaryColor)),
                        child: Row(
                          children: [
                            Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.lightbulb_outline,
                                      color: ColorPalette.primaryColor,
                                    ))),
                            const SizedBox(width: 24),
                            Expanded(
                                flex: 4,
                                child: Text(
                                  AppLocalizations.of(context)!.changeTheme,
                                  style: CustomStyle.itemText(context),
                                )),
                            Expanded(
                              child: FlutterSwitch(
                                width: 80,
                                height: 45,
                                toggleSize: 35,
                                value: light,
                                borderRadius: 30.0,
                                padding: 2.0,
                                activeToggleColor: Color(0xFF6E40C9),
                                inactiveToggleColor: Color(0xFF2F363D),
                                activeSwitchBorder: Border.all(
                                  color: Color(0xFF3C1E70),
                                  width: 6.0,
                                ),
                                inactiveSwitchBorder: Border.all(
                                  color: Color(0xFFD1D5DA),
                                  width: 6.0,
                                ),
                                activeColor: Color(0xFF271052),
                                inactiveColor: Colors.white,
                                activeIcon: const Icon(
                                  Icons.nightlight_round,
                                  color: Color(0xFFF8E3A1),
                                ),
                                inactiveIcon: const Icon(
                                  Icons.wb_sunny,
                                  color: Color(0xFFFFDF5D),
                                ),
                                onToggle: (val) {
                                  setState(() {
                                    light = val;
                                  });
                                  _saveLight(val);
                                  context
                                      .read<ChangeThemeCubit>()
                                      .toggleTheme();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        height: 82,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: ColorPalette.primaryColor)),
                        child: Row(
                          children: [
                            Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.language,
                                      color: ColorPalette.primaryColor,
                                    ))),
                            const SizedBox(width: 24),
                            Expanded(
                                flex: 4,
                                child: Text(
                                  AppLocalizations.of(context)!.changeLanguage,
                                  style: CustomStyle.itemText(context),
                                )),
                            Expanded(
                              child: FlutterSwitch(
                                showOnOff: true,
                                width: 80,
                                height: 45,
                                toggleSize: 35,
                                value: changeLanguage,
                                borderRadius: 30.0,
                                padding: 2.0,
                                activeText: "VI",
                                activeTextColor: Colors.black,
                                inactiveText: "EN",
                                inactiveTextColor: Colors.black,
                                activeToggleColor:
                                    Color.fromARGB(255, 251, 250, 251),
                                inactiveToggleColor: Color(0xFF2F363D),
                                activeSwitchBorder: Border.all(
                                  color: Color.fromARGB(255, 237, 110, 81),
                                  width: 6.0,
                                ),
                                inactiveSwitchBorder: Border.all(
                                  color: Color(0xFFD1D5DA),
                                  width: 6.0,
                                ),
                                activeColor: Color.fromARGB(255, 250, 51, 7),
                                inactiveColor: Colors.white,
                                activeIcon: const Icon(
                                  Icons.favorite,
                                  color: Color.fromARGB(255, 201, 82, 82),
                                ),
                                inactiveIcon: const Icon(
                                  Icons.favorite_border,
                                  color: Color.fromARGB(255, 229, 228, 223),
                                ),
                                onToggle: (val) {
                                  setState(() {
                                    changeLanguage = val;
                                  });
                                  _saveLanguage(val);
                                  context
                                      .read<ChangeLanguageCubit>()
                                      .changeLang();
                                  print(context
                                      .read<ChangeLanguageCubit>()
                                      .state
                                      .currentLocale);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 64),
                      Center(
                          child: SliderButton(
                        height: 60,
                        action: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              loginScreen, (route) => false);
                        },
                        label: Text(
                          AppLocalizations.of(context)!.logOut,
                          style: CustomStyle.itemText(context),
                        ),
                        icon: const Center(
                            child: Icon(
                          Icons.power_settings_new,
                          color: Colors.white,
                          size: 40,
                        )),

                        //Put BoxShadow here
                        boxShadow: const BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                        ),
                        shimmer: true,
                        vibrationFlag: true,
                        radius: 100,
                        buttonColor: Color(0xffd60000),
                        baseColor: ColorPalette.textItemColor,
                        highlightedColor: Colors.white,
                      ))
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
