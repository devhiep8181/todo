import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/assets.dart';
import 'package:todo/core/constants/color_palette.dart';
import 'package:todo/core/constants/text_style.dart';
import 'package:todo/core/language/cubit/change_language_cubit.dart';
import 'package:todo/representation/screen/home.dart';
import 'package:todo/representation/screen/login/sign_up_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextEdittingController =
      TextEditingController();
  final TextEditingController _passWordTextEdittingController =
      TextEditingController();
  final FocusNode _firstField = FocusNode();
  final FocusNode _secondField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => ChangeLanguageCubit())
      ],
      child: BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 52),
                      Image.asset(Assets.assets_image_frame1_png),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.login,
                        style: CustomStyle.titleText(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.subLogin,
                        style: CustomStyle.subText(context),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.assets_image_fb_png),
                          const SizedBox(width: 12),
                          Image.asset(Assets.assets_image_ig_png),
                          const SizedBox(width: 12),
                          Image.asset(Assets.assets_image_gg_png),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        focusNode: _firstField,
                        onFieldSubmitted: (value) {
                          _secondField.requestFocus();
                        },
                        controller: _emailTextEdittingController,
                        decoration: InputDecoration(
                            labelText: "Email",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.0, color: Color(0xffBEBAB3)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.0, color: Colors.red),
                              borderRadius: BorderRadius.circular(12),
                            )),
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return TextFormField(
                            focusNode: _secondField,
                            controller: _passWordTextEdittingController,
                            obscureText: (state as LoginInitial).obscureText,
                            decoration: InputDecoration(
                                labelText:
                                    AppLocalizations.of(context)!.password,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.0, color: Color(0xffBEBAB3)),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.0, color: Colors.red),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      // setState(() {
                                      //   obscureText = !obscureText;
                                      // });
                                      context
                                          .read<LoginCubit>()
                                          .toggleHidePassword();
                                    },
                                    icon: Icon(
                                      state.obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: ColorPalette.iconPassWordColor,
                                    ))),
                          );
                        },
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.forgotPass,
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorPalette.primaryColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                              )),
                          onPressed: () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailTextEdittingController.text,
                                    password:
                                        _passWordTextEdittingController.text)
                                .then((value) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (_) => HomeScreen()),
                                  (route) => false);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                child: Text(AppLocalizations.of(context)!.login,
                                    style: CustomStyle.buttonText(context)),
                              )
                            ],
                          )),
                      const SizedBox(height: 16),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const SignUp()));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.signUp,
                            style: CustomStyle.itemText(context),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
