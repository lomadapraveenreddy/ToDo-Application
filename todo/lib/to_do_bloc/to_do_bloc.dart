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

  @override
  Stream<ToDoState> mapEventToState(
    ToDoEvent event,
  ) async* {
    if(event is GetToDoEvent)
    {
      yield state;
    }
    else if(event is AddToDoEvent)
    {
      yield ToDoListState(state.todoList..insert(0,event.toDoObject),);
    }
  }
}
