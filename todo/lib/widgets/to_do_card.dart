import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:todo/routes/all_routes.dart';
import '../to_do_bloc/to_do_bloc.dart';
import '../models/todo.dart';

//This widget returns a card that takes ToDo object as argument
class ToDoCard extends StatelessWidget {
  final ToDoModel object;
  ToDoCard(this.object);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.of(context).pushNamed(DetailToDoView.routeName,arguments: object.id);
      BlocProvider.of<ToDoBloc>(context).getByID(object.id);
      },
          child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: ListTile(
            title: Text(object.title),
            subtitle: Text(DateFormat.yMMMd().format(object.deadline)),
          ),
        ),
      ),
    );
  }
}
