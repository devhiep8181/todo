import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo/cubit/todo_cubit.dart';


// ignore: must_be_immutable
class TodoOverviewOptionButton extends StatefulWidget {
  bool? checkbox;
  //List<TodoModel> todo;
  TodoOverviewOptionButton({super.key, required this.checkbox});

  @override
  State<TodoOverviewOptionButton> createState() =>
      _TodoOverviewOptionButtonState();
}

class _TodoOverviewOptionButtonState extends State<TodoOverviewOptionButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem(
          value: 1,
          child: Text("Make all completed"),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text("Clear completed"),
        ),
      ],
      onSelected: (value) {
        if (value == 1) {
          context.read<TodoCubit>().checkAllBox(widget.checkbox!);
        }
      },
    );
  }
}
