part of 'to_do_bloc.dart';

@immutable
abstract class ToDoEvent {}

class GetToDoEvent extends ToDoEvent{}



class AddToDoEvent extends ToDoEvent{
  final toDoObject;
  AddToDoEvent(this.toDoObject);
}

class EditToDoEvent extends ToDoEvent{
  final   String id;
  final   String title;
  final   String description;
  final   DateTime selectedDate;
  EditToDoEvent(this.id,this.title,this.description,this.selectedDate);
}

class DeleteToDoEvent extends ToDoEvent{
  final String id;
  DeleteToDoEvent(this.id);
}

class ShowAllEvent extends ToDoEvent{}

class ShowCompletedEvent extends ToDoEvent{}

class ShowActiveEvent extends ToDoEvent{}