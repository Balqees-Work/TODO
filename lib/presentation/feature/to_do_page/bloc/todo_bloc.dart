import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_bal/config/config_injection.dart';
import 'package:todo_bal/core/bloc/bloc_base_status.dart';
import 'package:todo_bal/data/exception/exception_todo.dart';
import 'package:todo_bal/data/model/m_todo.dart';
import 'package:todo_bal/domain/enitiy/to_do_entity.dart';
import 'package:todo_bal/domain/use_case/to_do_use_case.dart';
import 'package:uuid/uuid.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final toDoListUseCase = getIt<ToDoUseCase>();

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
    emit(state.copyWith(status: AppStatus.loading));
    try {
      final List<ToDoListEntity> todo = await toDoListUseCase.execute();
      await Future.delayed(const Duration(seconds: 2)); // simulate api

      emit(
        state.copyWith(
          status: AppStatus.success,
          todo: todo,
          // ads: [],
        ),
      );

      if (state.todo.isEmpty) {
        throw TodoException('not have data ');
      }
    } on TodoException catch (error) {
      // rethrow;
      emit(
        state.copyWith(status: AppStatus.error, errorMessage: error.toString()),
      );
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> _onAddTodoEvent(
    AddTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      final newTodo = ToDoListEntity(
        id: Uuid().v4().hashCode,
        title: event.title,
        description: event.description,
        createAt: DateTime.now(),
        img: "assets/images/bear.png",
        isDone: true,
        details: event.details,
      );

      final updatedList = List<ToDoListEntity>.from(state.todo)..add(newTodo);
      emit(state.copyWith(status: AppStatus.success, todo: updatedList));
    } catch (e) {
      emit(
        state.copyWith(
          status: AppStatus.error,
          errorMessage: "Failed to add task",
        ),
      );
    }
  }

  Future<void> _onRemoveTodoEvent(
    RemoveTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      // Because ModelTodo uses Equatable, .remove() works perfectly here
      final newList = List<ToDoListEntity>.from(state.todo)..remove(event.todo);
      emit(state.copyWith(status: AppStatus.success, todo: newList));
    } catch (e) {
      emit(
        state.copyWith(
          status: AppStatus.error,
          errorMessage: "Could not delete task",
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

      emit(state.copyWith(status: AppStatus.success, todo: updatedList));
    } catch (e) {
      emit(
        state.copyWith(status: AppStatus.error, errorMessage: "Update failed"),
      );
    }
  }
}
