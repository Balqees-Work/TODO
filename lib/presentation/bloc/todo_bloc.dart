import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_bal/data/model/m_todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<LoadTodosStarted>((event, emit) async {
      // start loading
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
      } catch (e) {
        emit(state.copyWith(status: TodoStatus.error, error: e.toString()));
      }
    });
  }
}
