import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_bal/data/exception/exception_todo.dart';
import 'package:todo_bal/data/model/m_todo.dart';
import 'package:uuid/uuid.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<LoadTodoStarted>(_onLoadTodoStarted);
    on<AddTodoEvent>(_onAddTodoEvent);
    on<RemoveTodoEvent>(_onRemoveTodoEvent);
    on<UpdateTodoEvent>(_onUpdateTodoEvent);
  }

  Future<void> _onLoadTodoStarted(
    LoadTodoStarted event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2)); // simulate api

      emit(
        state.copyWith(
          status: TodoStatus.success,
          todo: [
            ModelTodo(
              id: 1,
              title: "test",
              description: "test description",
              createAt: DateTime.now(),
            ),
            ModelTodo(
              id: 2,
              title: "test2",
              description: "test2 description",
              createAt: DateTime.now(),
            ),
          ],
          // ads: [],
        ),
      );

      if (state.todo.isEmpty) {
        throw TodoException('not have data ');
      }
    } on TodoException catch (error) {
      // rethrow;
      emit(state.copyWith(status: TodoStatus.error, error: error.toString()));
    } catch (e) {
      emit(state.copyWith(status: TodoStatus.error, error: e.toString()));
    }
  }

  Future<void> _onAddTodoEvent(
    AddTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      final newTodo = ModelTodo(
        id: Uuid().v4().hashCode,
        title: event.title,
        description: event.description,
        createAt: DateTime.now(),
      );

      final updatedList = List<ModelTodo>.from(state.todo)..add(newTodo);
      emit(state.copyWith(status: TodoStatus.success, todo: updatedList));
    } catch (e) {
      emit(
        state.copyWith(status: TodoStatus.error, error: "Failed to add task"),
      );
    }
  }

  Future<void> _onRemoveTodoEvent(
    RemoveTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      // Because ModelTodo uses Equatable, .remove() works perfectly here
      final newList = List<ModelTodo>.from(state.todo)..remove(event.todo);

      emit(state.copyWith(status: TodoStatus.success, todo: newList));
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
          error: "Could not delete task",
        ),
      );
    }
  }

  Future<void> _onUpdateTodoEvent(
    UpdateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      // Find the index and update for better performance than remove/add
      final updatedList = state.todo.map((todo) {
        return todo.id == event.todo.id ? event.todo : todo;
      }).toList();

      emit(state.copyWith(status: TodoStatus.success, todo: updatedList));
    } catch (e) {
      emit(state.copyWith(status: TodoStatus.error, error: "Update failed"));
    }
  }
}
