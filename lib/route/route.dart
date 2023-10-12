// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo/core/constants/cubit/cubit_provider.dart';
// import 'package:todo/representation/screen/home.dart';
// import 'package:todo/representation/screen/login/cubit/login_cubit.dart';
// import 'package:todo/representation/screen/login/login_screen.dart';
// import 'package:todo/representation/screen/login/sign_up_screen.dart';
// import 'package:todo/representation/screen/setting_screen.dart';
// import 'package:todo/todo/cubit/todo_cubit.dart';
// import 'package:todo/todo/view/todo_screen.dart';

// import 'router_const.dart';

// class Routes {
//   static Route<dynamic>? customRouteGenerator(RouteSettings settings) {
//     switch (settings.name) {
//       case todoScreen:
//         return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//                   providers: cubitProvider,
//                   child: const TodoScreen(),
//                 ));
//       case settingSceen:
//         return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//                 providers: cubitProvider, child: const SettingScreen()));
//       case homeScreen:
//         return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//                 providers: cubitProvider, child:HomeScreen()));
//       case loginScreen:
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider(
//                   create: (context) => LoginCubit(),
//                   child: const LoginScreen(),
//                 ));
//       case signUpScreen:
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider(
//                   create: (context) => LoginCubit(),
//                   child: const SignUp(),
//                 ));
//     }
//     return null;
//   }
// }
