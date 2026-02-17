import 'package:injectable/injectable.dart';
import 'package:todo_bal/data/model/m_todo.dart';
import 'package:uuid/uuid.dart';

@injectable
class ToDoListStatic {
  List<ModelTodo> getToDoListStatic() {
    return [
      ModelTodo(
        title: "Finish Flutter task",
        description: "Complete the to-do list screen.",
        img: "assets/images/bear.png",
        id: Uuid().v4().hashCode,
        createAt: DateTime.now(),
      ),
      ModelTodo(
        title: "Prepare meeting notes",
        description: "Discussion points for meeting.",
        img: "assets/images/bear.png",
        id: Uuid().v4().hashCode,
        createAt: DateTime.now(),
      ),
      ModelTodo(
        title: "Go for a walk",
        description: "Take a walk for fresh air and exercise.",
        img: "assets/images/bear.png",
        id: Uuid().v4().hashCode,
        createAt: DateTime.now(),
      ),
      ModelTodo(
        title: "Cook dinner",
        description: "Prepare a healthy homemade meal.",
        img: "assets/images/bear.png",
        id: Uuid().v4().hashCode,
        createAt: DateTime.now(),
      ),
      ModelTodo(
        title: "Water the plants",
        description: "Take care of the plants.",
        img: "assets/images/bear.png",
        id: Uuid().v4().hashCode,
        createAt: DateTime.now(),
      ),
      ModelTodo(
        title: "Read before bed",
        description: "Read a few pages before sleeping.",
        img: "assets/images/bear.png",
        id: Uuid().v4().hashCode,
        createAt: DateTime.now(),
      ),
    ];
  }
}
