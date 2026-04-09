import 'package:flutter/material.dart';
import 'package:todo_bal/data/model/m_todo.dart';
import 'package:todo_bal/domain/enitiy/to_do_entity.dart';

class ToDoDetailsPage extends StatelessWidget {
  final ToDoListEntity todo;
  const ToDoDetailsPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB08968),
        title: const Text(
          "Task Details",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFDCCCB4),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Center(
                  child: Image.asset(
                    todo.img,
                    //  fit: BoxFit.contain,
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              todo.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F4E37),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              todo.description,
              style: const TextStyle(fontSize: 16, color: Colors.brown),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            const SizedBox(height: 20),
            const Text(
              "Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6F4E37),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              todo.details,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFE6D5C3),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Color(0xFF6F4E37)),
                  const SizedBox(width: 10),
                  Text(
                    "Created at: ${todo.createAt}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6F4E37),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
