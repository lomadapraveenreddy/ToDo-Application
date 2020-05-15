part of 'to_do_bloc.dart';

@immutable
abstract class ToDoState {}

class ToDoInitial extends ToDoState {
  final ToDoModel object;
  ToDoInitial(this.object);
}
