part of 'to_do_bloc.dart';

@immutable
abstract class ToDoEvent {}

class GetToDoEvent extends ToDoEvent{}



class AddToDoEvent extends ToDoEvent{
  final toDoObject;
  AddToDoEvent(this.toDoObject);
}

//class EditToDoEvent extends ToDoEvent{}

class ShowAllEvent extends ToDoEvent{}

class ShowCompletedEvent extends ToDoEvent{}

class ShowActiveEvent extends ToDoEvent{}