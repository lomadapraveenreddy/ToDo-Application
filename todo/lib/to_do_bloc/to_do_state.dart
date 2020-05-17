part of 'to_do_bloc.dart';


class ToDoState {
  List<dynamic>todoList;
  ToDoState(this.todoList);
}


List<dynamic> get getToDoObjectsFromBox {
  var box = Hive.box('todoBox');
  return box.values.toList();
  
}

class ToDoInitial extends ToDoState {
  ToDoInitial():super(getToDoObjectsFromBox);
}

