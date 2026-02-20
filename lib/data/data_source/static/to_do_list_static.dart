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
        details:
            "Build the UI, connect it with Bloc, handle states, and test navigation to the details page.",
      ),
      ModelTodo(
        title: "Prepare meeting notes",
        description: "Discussion points for meeting.",
        img: "assets/images/bear.png",
        id: Uuid().v4().hashCode,
        createAt: DateTime.now(),
        details:
            "Write key discussion points and organize the project roadmap document.",
      ),
      ModelTodo(
        title: "Go for a walk",
        description: "Take a walk for fresh air and exercise.",
        img: "assets/images/bear.png",
        id: Uuid().v4().hashCode,
        createAt: DateTime.now(),
        details:
            "Walk at least 30 minutes in the park, listen to a podcast, and stretch after returning.",
      ),
      ModelTodo(
        title: "Cook dinner",
        description: "Prepare a healthy homemade meal.",
        img: "assets/images/bear.png",
        id: Uuid().v4().hashCode,
        createAt: DateTime.now(),
        details:
            "Cook grilled chicken with vegetables, avoid fast food and prepare lunch for tomorrow.",
      ),
      ModelTodo(
        title: "Water the plants",
        description: "Take care of the plants.",
        img: "assets/images/bear.png",
        id: Uuid().v4().hashCode,
        createAt: DateTime.now(),
        details:
            "Water indoor plants carefully, check soil moisture, and remove dry leaves.",
      ),
      ModelTodo(
        title: "Read before bed",
        description: "Read a few pages before sleeping.",
        img: "assets/images/bear.png",
        id: Uuid().v4().hashCode,
        createAt: DateTime.now(),
        details:
            "Read at least 20 pages of a self-development book and write down key takeaways.",
      ),
    ];
  }
}
