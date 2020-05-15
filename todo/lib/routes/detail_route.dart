import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../to_do_bloc/to_do_bloc.dart';
import '../models/todo.dart';

class DetailToDoView extends StatelessWidget {
  static final routeName='/DetailView';
  final String id;
  DetailToDoView(this.id);
  @override
  Widget build(BuildContext context) {
    ToDoModel toDoObject=BlocProvider.of<ToDoBloc>(context).getByID(id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: 
         Column(
          children: <Widget>[
            Text(toDoObject.title),
            Text(toDoObject.description),
            Text(DateFormat.yMMMd().format(toDoObject.deadline)),
          ],
        ),
    );
  }
}
