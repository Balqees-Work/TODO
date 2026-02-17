import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_bal/data/model/m_todo.dart';
import 'package:todo_bal/domain/enitiy/to_do_entity.dart';
import 'package:todo_bal/presentation/widgets/w_card.dart';

class WidgetLayoutTodo extends StatelessWidget {
  const WidgetLayoutTodo({super.key, required this.todos});
  final List<ToDoListEntity> todos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
      child: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return WidgetCard(todo: todos[index], index: index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 10);
        },
      ),
    );
  }
}
