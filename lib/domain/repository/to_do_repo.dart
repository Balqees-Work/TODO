import 'package:todo_bal/domain/enitiy/to_do_entity.dart';

abstract class ToDoRepository {
  Future<List<ToDoListEntity>> getTodDoList();
}
