part of 'to_do_bloc.dart';

@immutable
abstract class ToDoState {
  
  final todoList=[];
}

class ToDoInitial extends ToDoState {

  final todoList=[
    ToDoModel(id: '1',title: 'Work 1',description: 'des 1',deadline: DateTime.now()),
    ToDoModel(id: '2',title: 'Work 2',description: 'des 2',deadline: DateTime.now()),
    ToDoModel(id: '3',title: 'Work 3',description: 'des 3',deadline: DateTime.now()),
  ];
}
class LoadingState extends ToDoState{}

class ToDoListState extends ToDoState{
  final todoList;
  ToDoListState(this.todoList);
}

class ToDoObjectState extends ToDoState{
  @override
  final todoList;
  ToDoObjectState(this.todoList);
}