import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_bal/core/bloc/bloc_status_builder.dart';
import 'package:todo_bal/presentation/feature/to_do_page/bloc/todo_bloc.dart';
import 'package:todo_bal/presentation/feature/to_do_page/widgets/w_layout_todo.dart';

class PageTodo extends StatelessWidget {
  const PageTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        backgroundColor: const Color(0xFFB08968),
      ),
      backgroundColor: Color(0xFFDCCCB4),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return BlocStatusBuilder(
            state: state,
            builder: WidgetLayoutTodo(todos: state.todo),
          );
        },
      ),
    );
  }
}
