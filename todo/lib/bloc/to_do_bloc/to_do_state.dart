part of 'to_do_bloc.dart';


class ToDoState {
  List<dynamic>todoList;
  ToDoState({this.todoList});
}



class ToDoInitial extends ToDoState {
  final todoList;
  ToDoInitial(this.todoList);
}

