// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

enum TodoProcessStatus { add, delete, update }

@immutable
class TodoState extends BlocBaseStatus {
  final List<ToDoListEntity> todo; // service
  final TodoProcessStatus? processStatus;

  const TodoState({
    this.todo = const [],
    this.processStatus,
    super.status,
    super.errorMessage,
  });

  TodoState copyWith({
    List<ToDoListEntity>? todo,
    AppStatus? status,
    TodoProcessStatus? processStatus,
    String? errorMessage,
  }) {
    return TodoState(
      todo: todo ?? this.todo,
      status: status ?? this.status,
      processStatus: processStatus ?? this.processStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [...super.props, todo, processStatus];

  @override
  bool get stringify => true;
}
