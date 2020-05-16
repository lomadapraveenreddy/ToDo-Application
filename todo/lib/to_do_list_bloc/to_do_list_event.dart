part of 'to_do_list_bloc.dart';

@immutable
abstract class ToDoListEvent {}

class GetToDoEvent extends ToDoListEvent{}



class AddToDoEvent extends ToDoListEvent{
  final toDoObject;
  AddToDoEvent(this.toDoObject);
}

//class EditToDoEvent extends ToDoListEvent{}

class ShowAllEvent extends ToDoListEvent{}

class ShowCompletedEvent extends ToDoListEvent{}

class ShowActiveEvent extends ToDoListEvent{}