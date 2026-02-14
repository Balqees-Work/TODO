import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bal/data/model/m_todo.dart';
import 'package:todo_bal/presentation/bloc/todo_bloc.dart';

class WidgetCard extends StatelessWidget {
  const WidgetCard({super.key, required this.todo});

  final ModelTodo todo;

  @override
  Widget build(BuildContext context) {
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

      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(todo.description),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () => context.read<TodoBloc>().add(RemoveTodoEvent(todo)),
      ),
    );
  }
}
