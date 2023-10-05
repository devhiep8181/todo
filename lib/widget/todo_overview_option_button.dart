import 'package:flutter/material.dart';
import 'package:todo/todo/model/todo_model.dart';

class TodoOverviewOptionButton extends StatefulWidget {
  bool? checkbox;
  List<TodoModel> todo = [];
  TodoOverviewOptionButton(
      {super.key, required this.checkbox, required this.todo});

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
          print("aaaa");
          setState(() {
            widget.checkbox = true;
            widget.todo
                .forEach((element) => element.isCompleted = widget.checkbox);
          });
        }
      },
    );
  }
}
