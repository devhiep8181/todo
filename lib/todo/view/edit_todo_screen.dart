import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo/cubit/todo_cubit.dart';
import 'package:todo/todo/model/todo_model.dart';

class EditTodoScreen extends StatefulWidget {
  final void Function(int index, TodoModel todo) editTodo;
  final TodoModel todo;
  final int index;
  EditTodoScreen(
      {super.key,
      required this.todo,
      required this.index,
      required this.editTodo});

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final TextEditingController _title = TextEditingController();

  final TextEditingController _subTitle = TextEditingController();

  @override
  void initState() {
    super.initState();
    _title.text = widget.todo.title!;
    _subTitle.text = widget.todo.subTitle!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _title,
              decoration: const InputDecoration(labelText: "Titile"),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _subTitle,
              decoration: const InputDecoration(labelText: "SubTitle"),
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(widget.index.toString()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  final todos = TodoModel(
                      id: widget.todo.id,
                      title: _title.text,
                      subTitle: _subTitle.text);
                  // context.read<TodoCubit>().editTodo(widget.index, todos);
                  widget.editTodo.call(widget.index, todos);
                  Navigator.of(context).pop();
                },
                child: const Text("Edit")),
          ],
        ),
      ),
    );
  }
}
