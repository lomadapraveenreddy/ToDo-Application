import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId:0)
class ToDoModel{
  @HiveField(0)
  String id=DateTime.now().toString();
  @HiveField(1)
  bool isCompleted=false;
  @HiveField(2)
  String title;
  @HiveField(3)
  String description;
  @HiveField(4)
  DateTime deadline;

  ToDoModel({this.id,this.title,this.description,this.deadline});
}