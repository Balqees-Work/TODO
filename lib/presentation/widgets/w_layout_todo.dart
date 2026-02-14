import 'package:flutter/material.dart';
import 'package:todo_bal/data/model/m_todo.dart';
import 'package:todo_bal/presentation/widgets/w_card.dart';

class WidgetLayoutTodo extends StatelessWidget {
  const WidgetLayoutTodo({super.key, required this.todos});
  final List<ModelTodo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => WidgetCard(todo: todos[index]),
    );
  }
}
