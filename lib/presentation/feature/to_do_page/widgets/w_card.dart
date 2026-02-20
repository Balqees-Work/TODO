import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_bal/data/model/m_todo.dart';
import 'package:todo_bal/domain/enitiy/to_do_entity.dart';
import 'package:todo_bal/presentation/feature/to_do_page/bloc/todo_bloc.dart';

class WidgetCard extends StatelessWidget {
  const WidgetCard({super.key, required this.todo, required this.index});

  final ToDoListEntity todo;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    return Slidable(
      key: ValueKey(index),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              print("Favorite tapped");
            },
            backgroundColor: Color(0xFFDCCCB4),
            foregroundColor: Colors.brown.shade400,
            icon: Icons.favorite,
            label: 'Favorite',
          ),
          SlidableAction(
            onPressed: (context) {
              bloc.add(RemoveTodoEvent(todo));
            },
            backgroundColor: Color(0xFFDCCCB4),
            foregroundColor: Colors.brown.shade400,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          context.push('/details', extra: todo);
        },
        child: Card(
          elevation: 8,
          shadowColor: Colors.brown.shade500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: const Color(0xFFB08968),
          child: ListTile(
            leading: Container(
              height: 65,
              width: 65,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFC19A6B),
              ),
              child: Image.asset(
                todo.img,
                height: 45,
                width: 45,
                fit: BoxFit.contain,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Text(
                  todo.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  todo.createAt.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
