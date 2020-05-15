import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/todo.dart';

part 'to_do_list_event.dart';
part 'to_do_list_state.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  @override
  ToDoListState get initialState => ToDoListInitial();
  void newToDo(toDoObject) {
    add(AddToDoEvent(toDoObject));
  }

  ToDoModel getByID(String id) {
    return state.todoList.firstWhere((object) => id == object.id);
  }

  void toggleCompletion(String id) {
    getByID(id).isCompleted = !getByID(id).isCompleted;
    add(GetToDoEvent());
  }

  void editToDo(String id,String title,String description,DateTime selectedDate) {
    print('edit bloc');
    int index = state.todoList.indexWhere((object) => id == object.id);
    print('index $index');
    ToDoModel object=state.todoList[index];
    object.title=title;
    object.description=description;
    object.deadline=selectedDate;
    add(GetToDoEvent());
  }
  void deleteToDo(String id)
  {
    state.todoList.removeWhere((object){
      return id==object.id;
    });
    add(GetToDoEvent());
  }
  @override
  Stream<ToDoListState> mapEventToState(
    ToDoListEvent event,
  ) async* {
    if (event is AddToDoEvent) {
      yield ToDoList(
        state.todoList..insert(0, event.toDoObject),
      );
    } else if (event is GetToDoEvent) {
      yield ToDoList(state.todoList);
    }
  }
}
