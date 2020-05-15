import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../models/todo.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  @override
  ToDoState get initialState => ToDoInitial();

  void newToDo(toDoObject)
  {
    add(AddToDoEvent(toDoObject));
  }
  ToDoModel getByID(String id)
  {
    return state.todoList.firstWhere((object)=> id==object.id);
  
  }
  void toggleCompletion(String id)
  {
      getByID(id).isCompleted=!getByID(id).isCompleted;
      add(GetToDoEvent());
  }
  @override
  Stream<ToDoState> mapEventToState(
    ToDoEvent event,
  ) async* {
 
     if(event is AddToDoEvent)
    {
      yield ToDoListState(state.todoList..insert(0,event.toDoObject),);
    }
    else if(event is GetToDoEvent)
    {
      yield ToDoListState(state.todoList);
    }
  }

  @override
  Future<void> close() {
    
    return super.close();
  }
}
