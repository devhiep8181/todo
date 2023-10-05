import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../todo/cubit/todo_cubit.dart';

class TodoOverViewFilterButton extends StatefulWidget {
  @override
  State<TodoOverViewFilterButton> createState() =>
      _TodoOverViewFilterButtonState();
}

class _TodoOverViewFilterButtonState extends State<TodoOverViewFilterButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Filter>(
      itemBuilder: (BuildContext cnt) => [
        PopupMenuItem(
          value: Filter.active,
          child: Text("Active"),
        ),
        PopupMenuItem(
          value: Filter.complete,
          child: Text("Completed"),
        ),
        PopupMenuItem(
          value: Filter.all,
          child: Text("All"),
        ),
      ],
      icon: const Icon(Icons.format_list_bulleted),
      onSelected: (Filter value) {
        context.read<TodoCubit>().setFilter(value);
      },
    );
  }
}
