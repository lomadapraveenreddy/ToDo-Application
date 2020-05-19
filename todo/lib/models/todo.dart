import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class ToDoModel {
  @HiveField(0)
  String id = DateTime.now().toString();
  @HiveField(1)
  bool isCompleted = false;
  @HiveField(2)
  String title;
  @HiveField(3)
  String description;
  @HiveField(4)
  DateTime deadline;
  @HiveField(5)
  bool isFavourite = false;
  ToDoModel({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.deadline,
  });
}
