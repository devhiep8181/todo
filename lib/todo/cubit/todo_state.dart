part of 'todo_cubit.dart';

class TodoState extends Equatable {
  final List<TodoModel> todos; //list hien thi
  final List<TodoModel> filterTodo; //list loc
  const TodoState({required this.todos, required this.filterTodo});
  @override

  List<Object?> get props => [todos, filterTodo];

  TodoState copyWith({
    List<TodoModel>? todos,
    List<TodoModel>? filterTodo,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      filterTodo: filterTodo ?? this.filterTodo,
    );
  }
}

// final class TodoInitial extends TodoState {
//   // @override
//   // // TODO: implement props
//   // List<Object> get props => [todos];
//   // TodoInitial copyWith(List<TodoModel>? newTodo) {
//   //   return TodoInitial(newTodo ?? todos);
//   // }
// }
