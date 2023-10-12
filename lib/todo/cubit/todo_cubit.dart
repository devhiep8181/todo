import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo/todo/model/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoState(todos: [], filterTodo: []));

  void addTodo(TodoModel todo) {
    //final updateTodo = [...state.todos]..add(todo); dòng dưới tương đương
    final updateTodo = [...state.todos, todo];
    emit(TodoState(todos: updateTodo, filterTodo: updateTodo));
  }

  void editTodo(int index, TodoModel todo) {
    // state.todos[index] = todo;
    final listTodo = [...state.todos];
    listTodo[index] = todo;
    emit(TodoState(todos: listTodo, filterTodo: listTodo));
    // final updateTodo = [...state.todos]..replaceRange(index, index + 1, [todo]);
    //  emit(TodoState(todos: updateTodo));
  }

  void removeTodo(TodoModel todo) {
    final newTodo = [...state.todos]..remove(todo);
    emit(TodoState(todos: newTodo, filterTodo: newTodo));
  }

  void removeAll() {
    final newTodo = [...state.filterTodo]
      ..removeRange(0, state.filterTodo.length);
    emit(TodoState(todos: newTodo, filterTodo: state.filterTodo));
  }

  void setFilter(Filter event) {
    List<TodoModel> todoFilter = [];
    switch (event) {
      case Filter.active:
        todoFilter =
            state.filterTodo.where((element) => !element.isCompleted!).toList();
        break;
      case Filter.complete:
        todoFilter =
            state.filterTodo.where((element) => element.isCompleted!).toList();
        break;
      case Filter.all:
        todoFilter = [...state.filterTodo];
        break;
    }
    emit(TodoState(todos: todoFilter, filterTodo: state.filterTodo));
  }

  void checkAllBox(bool check) {
    check = !check;
    final newTodo = [...state.filterTodo]
      ..forEach((element) => element.isCompleted = check);
    emit(TodoState(todos: newTodo, filterTodo: state.filterTodo));
  }
}

enum Filter { active, complete, all }
