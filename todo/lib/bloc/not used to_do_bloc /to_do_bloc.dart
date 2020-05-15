import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/models/todo.dart';


part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  @override
  ToDoState get initialState => ToDoInitial(object);
  ToDoModel object;
  ToDoBloc(this.object);
  @override
  Stream<ToDoState> mapEventToState(
    ToDoEvent event,
  ) async* {
    if(event is ToDoEvent)
    {}
  }
}
