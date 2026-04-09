class ToDoListEntity {
  final int id;
  final String title;
  final String description;
  final bool isDone;
  final DateTime createAt;
  final String img;
  final String details;

  ToDoListEntity({
    required this.title,
    required this.description,
    required this.img,
    required this.id,
    required this.isDone,
    required this.createAt,
    required this.details,
  });
}
