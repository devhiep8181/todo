import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo/cubit/todo_cubit.dart';
import 'package:todo/todo/view/add_todo_screen.dart';
import 'package:todo/todo/view/edit_todo_screen.dart';
import 'package:todo/widget/todo_overview_filter_button.dart';
import 'package:todo/widget/todo_overview_option_button.dart';

class TodoScreen extends StatefulWidget {
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool checkBox = false;
  @override
  Widget build(BuildContext context) {
    // final TodoCubit _todoCubit = BlocProvider.of<TodoCubit>(context);

    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Todo"),
            actions: [
              TodoOverViewFilterButton(),
              IconButton(
                  onPressed: () {
                    checkBox = !checkBox;
                    state.todos
                        .forEach((element) => element.isCompleted = checkBox);
                  },
                  icon: const Icon(Icons.check))
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: state.todos.length,
                  itemBuilder: (_, index) {
                    return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart, //right to left
                        onDismissed: (direction) {
                          context
                              .read<TodoCubit>()
                              .removeTodo(state.todos[index]);
                        },
                        child: ListTile(
                          leading: Checkbox(
                              value: state.todos[index].isCompleted,
                              onChanged: (newValue) {
                                setState(() {
                                  state.todos[index].isCompleted = newValue;
                                });
                              }),
                          title: Text(
                            state.todos[index].title!,
                            style: state.todos[index].isCompleted == true
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough)
                                : null,
                          ),
                          subtitle: Text(
                            state.todos[index].subTitle!,
                            style: state.todos[index].isCompleted == true
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough)
                                : null,
                          ),
                          onTap: () async {
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => EditTodoScreen(
                                      todo: state.todos[index],
                                      index: index,
                                      editTodo:
                                          context.read<TodoCubit>().editTodo,
                                    )));
                          },
                        ));
                  })),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AddTodoScreen(
                      addTodo: context.read<TodoCubit>().addTodo)));
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
