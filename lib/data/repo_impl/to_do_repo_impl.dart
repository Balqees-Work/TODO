import 'package:injectable/injectable.dart';
import 'package:todo_bal/data/data_source/static/to_do_list_static.dart';
import 'package:todo_bal/data/model/m_todo.dart';
import 'package:todo_bal/domain/enitiy/to_do_entity.dart';
import 'package:todo_bal/domain/repository/to_do_repo.dart';

@Injectable(as: ToDoRepository)
class ToDoRepoImplementation extends ToDoRepository {
  final ToDoListStatic toDoListStatic;
  ToDoRepoImplementation(this.toDoListStatic);
  @override
  Future<List<ToDoListEntity>> getTodDoList() async {
    try {
      final toDoList = toDoListStatic.getToDoListStatic();
      if (toDoList.isEmpty) {
        throw Exception("no data found");
      }
      return toDoList.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
