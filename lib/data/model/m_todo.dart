// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class ModelTodo extends Equatable {
  final int id;
  final String title;
  final String description;
  final bool isDone;
  final DateTime createAt;

  const ModelTodo({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
    required this.createAt,
  });
  // ob1 = ModelTodo(id: 1, title:"test","description":"test description",isDone:false)
  // obj2 =  ob1.copyWith(title:"mohamed"); // id: 1, title:"Mohamed","description":"test description",isDone:false
  ModelTodo copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
    DateTime? createAt,
  }) {
    return ModelTodo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      createAt: createAt ?? this.createAt,
    );
  }

  @override
  List<Object?> get props => [id, title, description, isDone, createAt];

  @override
  bool get stringify => true;

  // @override
  // bool operator ==(covariant ModelTodo other) {
  //   if (identical(this, other)) return true;

  //   return other.id == id &&
  //       other.title == title &&
  //       other.description == description &&
  //       other.isDone == isDone;
  // }

  // @override
  // int get hashCode {
  //   return id.hashCode ^
  //       title.hashCode ^
  //       description.hashCode ^
  //       isDone.hashCode;
  // }
}

// ModelTodo(id: 1, title:"test","description":"test description",isDone:false)
// ModelTodo(id: 1, title:"test","description":"test description",isDone:false)
