class ToDoModel{
  final String id;
  bool isCompleted=false;
  String title;
  String description;
  DateTime deadline;
  ToDoModel({this.id,this.title,this.description,this.deadline});
}