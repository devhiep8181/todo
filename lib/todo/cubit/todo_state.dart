part of 'todo_cubit.dart';

class TodoState extends Equatable {
  final List<TodoModel> todos;
  TodoState({required this.todos});
  @override
  // TODO: implement props
  List<Object?> get props => [todos];

  TodoState copyWith({
    List<TodoModel>? todos,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
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
