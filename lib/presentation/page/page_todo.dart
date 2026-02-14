import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bal/presentation/bloc/todo_bloc.dart';

import 'package:todo_bal/presentation/widgets/w_layout_todo.dart';

class PageTodo extends StatelessWidget {
  const PageTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.status == TodoStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == TodoStatus.error) {
            return Center(child: Text(state.error ?? ''));
          }

          return WidgetLayoutTodo(todos: state.todo);
        },
      ),
    );
  }
}
