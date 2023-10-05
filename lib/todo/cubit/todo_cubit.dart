import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo/todo/model/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState(todos: const []));

  void addTodo(TodoModel todo) {
    final updateTodo = [...state.todos]..add(todo);
    emit(TodoState(todos: updateTodo));
  }

  void editTodo(int index, TodoModel todo) {
    // state.todos[index] = todo;
    final listTodo = [...state.todos];
    listTodo[index] = todo;
    emit(TodoState(todos: listTodo));
    // final updateTodo = [...state.todos]..replaceRange(index, index + 1, [todo]);
    //  emit(TodoState(todos: updateTodo));
  }

  void removeTodo(TodoModel todo) {
    final newTodo = [...state.todos]..remove(todo);
    emit(TodoState(todos: newTodo));
  }

  void setFilter(Filter event) {
    List<TodoModel> todoFilter = [];
    switch (event) {
      case Filter.active:
        todoFilter =
            state.todos.where((element) => !element.isCompleted!).toList();
        print(todoFilter);
        print("active");
        break;
      case Filter.complete:
        todoFilter =
            state.todos.where((element) => element.isCompleted!).toList();
        print(todoFilter);
        print("complete");
        break;
      case Filter.all:
        todoFilter = [...state.todos];
        print(todoFilter);
        print("all");
        break;
    }
    emit(state.copyWith(todos: todoFilter));
  }
}

enum Filter { active, complete, all }
