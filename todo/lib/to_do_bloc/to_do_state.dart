part of 'to_do_bloc.dart';


class ToDoState {
  List<dynamic>todoList=Hive.box('todoBox').values.toList();
  ToDoState({this.todoList});
}


List<dynamic> get getToDoObjectsFromBox {
  var box = Hive.box('todoBox');
  return box.values.toList();
  
}

class ToDoInitial extends ToDoState {
  ToDoInitial():super(todoList:getToDoObjectsFromBox);
}

