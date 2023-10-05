import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo/cubit/todo_cubit.dart';
import 'package:todo/todo/view/add_todo_screen.dart';
import 'package:todo/todo/view/todo_screen.dart';

import 'router_const.dart';

class Routes {
  static Route<dynamic>? customRouteGenerator(RouteSettings settings) {
    switch (settings.name) {
      case todoScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => TodoCubit(),
                  child: TodoScreen(),
                ));
      // case addTodo:
      //   return MaterialPageRoute(builder: (_) => AddTodoScreen());
    }
    return null;
  }
}
