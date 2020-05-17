import 'dart:async';

import 'package:hive/hive.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/todo.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final _todoBox = Hive.box('todoBox');
  @override
  ToDoState get initialState => ToDoInitial();

  void newToDo(toDoObject) {
    add(AddToDoEvent(toDoObject));
  }

  ToDoModel getByID(String id) {
    return _todoBox.values.firstWhere((object) => id == object.id);
  }

  void toggleCompletion(String id) {
    List<dynamic> list = _todoBox.values.toList();
    int index = list.indexWhere((element) => id == element.id);
    print('index $index');
    list[index].isCompleted = !list[index].isCompleted;
    _todoBox.putAt(index, list[index]);
    add(GetToDoEvent());
  }

  void editToDo(
    String id,
    String title,
    String description,
    DateTime selectedDate,
  ) {
    add(EditToDoEvent(id, title, description, selectedDate));
  }

  void deleteToDo(String id) {
    add(DeleteToDoEvent(id));
  }

  void showAllToDo() {
    add(GetToDoEvent());
  }

  void showCompleted() {
    add(ShowCompletedEvent());
  }

  void showActive() {
    add(ShowActiveEvent());
  }

  @override
  Stream<ToDoState> mapEventToState(
    ToDoEvent event,
  ) async* {
    if (event is AddToDoEvent) {
      _todoBox.add(event.toDoObject);
      yield ToDoState();
    } else if (event is GetToDoEvent) {
      yield ToDoState();
    } else if (event is EditToDoEvent) {
      int index = _todoBox.values
          .toList()
          .indexWhere((object) => event.id == object.id);
      var object = ToDoModel(
        id: event.id,
        title: event.title,
        description: event.description,
        deadline: event.selectedDate,
      );
      _todoBox.putAt(index, object);
      yield ToDoState();
    } else if (event is DeleteToDoEvent) {
      _todoBox.deleteAt(_todoBox.values
          .toList()
          .indexWhere((element) => event.id == element.id));
      yield ToDoState();
    } else if (event is ShowAllEvent) {
      yield ToDoState();
    } else if (event is ShowCompletedEvent) {
      print('completed');
      List list = _todoBox.values.toList();
      list = list.where((e) => e.isCompleted).toList();
      yield ToDoState(todoList: list);
    } else if (event is ShowActiveEvent) {
      print('Active');
      List list = _todoBox.values.toList();
      list = list.where((e) => !e.isCompleted).toList();
      yield ToDoState(todoList: list);
    }
  }
}
