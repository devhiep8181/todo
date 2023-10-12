import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/assets.dart';
import 'package:todo/core/constants/color_palette.dart';
import 'package:todo/core/constants/text_style.dart';
import 'package:todo/core/language/cubit/change_language_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/representation/screen/home.dart';
import '../../../route/router_const.dart';
import 'cubit/login_cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailTextEdittingController =
      TextEditingController();
  final TextEditingController _passWordTextEdittingController =
      TextEditingController();
  final TextEditingController _nameTextEdittingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => LoginCubit())],
        child: BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
            builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 52),
                      Image.asset(Assets.assets_image_frame1_png),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.signUp,
                        style: CustomStyle.titleText(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.subSignUp,
                        style: CustomStyle.headingText(context),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nameTextEdittingController,
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.name,
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
                      TextFormField(
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
                                    //   _obscureText = !_obscureText;
                                    // });
                                    context
                                        .read<LoginCubit>()
                                        .toggleHidePassword();
                                  },
                                  icon: Icon((state.obscureText)
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  color: ColorPalette.iconPassWordColor,
                                )),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
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
                                .createUserWithEmailAndPassword(
                                    email: _emailTextEdittingController.text,
                                    password:
                                        _passWordTextEdittingController.text)
                                .then((value) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (_) => HomeScreen(
                                            nameAccount:
                                                _nameTextEdittingController
                                                    .text,
                                            emailAcount:
                                                _emailTextEdittingController
                                                    .text,
                                          )),
                                  (route) => false);
                            });
                            //them man hinh alog thong bao dang ki thanh cong
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                child: Text("Sign up",
                                    style: CustomStyle.buttonText(context)),
                              )
                            ],
                          )),
                      const SizedBox(height: 16),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // FirebaseAuth.instance.signOut().then((value) {
                            //   Navigator.of(context).pop();
                            // });
                          },
                          child: Text("Log in",
                              style: CustomStyle.itemText(context))),
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
