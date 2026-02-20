// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

enum TodoStatus { initial, loading, success, error }

@immutable
class TodoState extends Equatable {
  final List<ToDoListEntity> todo; // service
  final TodoStatus status;
  final String? error;

  const TodoState({
    this.todo = const [],
    this.status = TodoStatus.initial,
    this.error,
  });

  TodoState copyWith({
    List<ToDoListEntity>? todo,
    TodoStatus? status,
    String? error,
  }) {
    return TodoState(
      todo: todo ?? this.todo,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [todo, status, error];

  @override
  bool get stringify => true;
}
