part of 'to_do_list_bloc.dart';


class ToDoListState {
  List<dynamic>todoList;
  ToDoListState(this.todoList);
}


List<dynamic> get getToDoObjectsFromBox {
  var box = Hive.box('todoBox');
  return box.values.toList();
  
}

class ToDoListInitial extends ToDoListState {
  ToDoListInitial():super(getToDoObjectsFromBox);
}

