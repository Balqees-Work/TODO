import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bal/presentation/bloc/todo_bloc.dart';

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
          final todos = state.todo;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              final title = todo.title;
              return ListTile(
                onTap: () {
                  // context.push(
                  //   '/details',
                  //   extra: {
                  //     'todo': todo,
                  //     'bloc': context
                  //         .read<TodoBloc>(), // Pass the current Bloc instance
                  //   },
                  // );
                },

                title: Text(state.status == .error ? '👊 $title' : '✅ $title'),
                subtitle: Text(todo.description),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () =>
                      context.read<TodoBloc>().add(RemoveTodoEvent(todo)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
