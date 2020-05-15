part of 'to_do_list_bloc.dart';

@immutable
abstract class ToDoListState {
  final todoList=[];
}

class ToDoListInitial extends ToDoListState {
  final todoList=[
    ToDoModel(id: '1',title: 'Work 1',description: 'des 1',deadline: DateTime.now()),
    ToDoModel(id: '2',title: 'Work 2',description: 'des 2',deadline: DateTime.now()),
    ToDoModel(id: '3',title: 'Work 3',description: 'des 3',deadline: DateTime.now()),
  ];
}


class ToDoList extends ToDoListState{
  final todoList;
  ToDoList(this.todoList);
}
