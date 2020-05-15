part of 'to_do_bloc.dart';

@immutable
abstract class ToDoEvent {}

class GetToDoEvent extends ToDoEvent{}



class AddToDoEvent extends ToDoEvent{
  final toDoObject;
  AddToDoEvent(this.toDoObject);
}

class GetObjectWithID extends ToDoEvent{
  final toDoObject;
  GetObjectWithID(this.toDoObject);
}