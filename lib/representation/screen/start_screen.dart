import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/core/constants/text_style.dart';
import 'package:todo/representation/screen/login/login_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 120, left: 32, right: 32, bottom: 32),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              const Color(0xffE50000).withOpacity(0.13),
              const Color.fromRGBO(21, 147, 175, 0.66).withOpacity(0.73)
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.assets_image_frame1_png),
            const SizedBox(height: 60),
            Text(
              AppLocalizations.of(context)!.solgan,
              style: CustomStyle.sloganText(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 45),
            Text(
              AppLocalizations.of(context)!.gift,
              style: CustomStyle.giftText(context),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
