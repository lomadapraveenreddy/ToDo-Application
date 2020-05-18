import 'package:flutter_test/flutter_test.dart';
import '../lib/models/todo.dart';
import '../lib/bloc/to_do_bloc/to_do_bloc.dart' as blocFile;

void main() {

  test('ToDo Bloc Test',(){
      var  _bloc=blocFile.ToDoBloc();
      var id=DateTime.now().toString();
      var title='test';
      var description='description';
      var deadline=DateTime.now();
      _bloc.newToDo(ToDoModel(id:id,title:title,description:description,deadline:deadline));
      expect(id, _bloc.state.todoList[_bloc.state.todoList.length-1].id);
    _bloc.close();
  } );
}