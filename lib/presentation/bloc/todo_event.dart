part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when the app starts to fetch initial data
class LoadTodoStarted extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String title;
  final String description;

  const AddTodoEvent({required this.title, required this.description});

  @override
  List<Object?> get props => [title, description];
}

class UpdateTodoEvent extends TodoEvent {
  final ModelTodo todo;
  const UpdateTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo];
}

class RemoveTodoEvent extends TodoEvent {
  final ModelTodo todo;
  const RemoveTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo];
}
