import 'package:injectable/injectable.dart';
import 'package:todo_bal/domain/enitiy/to_do_entity.dart';
import 'package:todo_bal/domain/repository/to_do_repo.dart';

@Injectable()
class ToDoUseCase {
  ToDoRepository toDoRepository;
  ToDoUseCase({required this.toDoRepository});

  Future<List<ToDoListEntity>> execute() async {
    return await toDoRepository.getTodDoList();
  }
}
