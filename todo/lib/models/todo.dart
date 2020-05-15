class ToDoModel{
  String id=DateTime.now().toString();
  bool isCompleted=false;
  String title;
  String description;
  DateTime deadline;
  ToDoModel({this.id,this.title,this.description,this.deadline});
}