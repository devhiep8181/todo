import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo/cubit/todo_cubit.dart';
import 'package:todo/todo/model/todo_model.dart';
import 'package:uuid/uuid.dart';

class AddTodoScreen extends StatefulWidget {
  void Function(TodoModel) addTodo;
  AddTodoScreen({super.key, required this.addTodo});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _subtitle = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode =
      FocusNode(); //khai bao de tat ban phim khi nhap xong
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _title.dispose();
    _subtitle.dispose();
    _focusNode.dispose();
    _focusNode1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _title,
              focusNode: _focusNode1,
              onFieldSubmitted: (value) {
                _focusNode.requestFocus();
              },
              decoration: const InputDecoration(
                labelText: "title",
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _subtitle,
              decoration: const InputDecoration(
                labelText: "subtitle",
              ),
              focusNode: _focusNode,
              onFieldSubmitted: (value) {
                _focusNode.unfocus(); // tu tat ban phim
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  final todo = TodoModel(
                      title: _title.text,
                      subTitle: _subtitle.text,
                      id: const Uuid().v4());
                  // BlocProvider.of<TodoCubit>(context).addTodo(todo);
                  // context.read<TodoCubit>().addTodo(todo);
                  widget.addTodo.call(todo);
                  Navigator.of(context).pop();
                  // _subtitle.clear();
                  // _title.clear();
                },
                child: const Text("ADD")),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: const Text("Back")),
            // const SizedBox(height: 16),
            // BlocBuilder<TodoCubit, TodoState>(
            //   builder: (context, state) {
            //     if (state is TodoInitial) {
            //       final todos = state.todos;
            //       return state.todos.isNotEmpty
            //           ? Expanded(
            //               child: ListView.builder(
            //                   itemCount: todos.length,
            //                   itemBuilder: (_, index) {
            //                     final TodoModel todo = todos[index];
            //                     return ListTile(
            //                       title: Text(todo.title!),
            //                     );
            //                   }))
            //           : const Text("dcM");
            //     }
            //     return const Text("cc");
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
