import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/routes/all_routes.dart';

import '../models/todo.dart';
import '../to_do_bloc/to_do_bloc.dart';

//This widget returns a card that takes ToDo object as argument
class ToDoCard extends StatelessWidget {
  final ToDoModel object;
  ToDoCard(this.object);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        BlocProvider.of<ToDoBloc>(context).toggleCompletion(object.id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: object.isCompleted
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                ),
                child: IconButton(
                    icon: Icon(
                      object.isCompleted ? Icons.done : Icons.remove,
                    ),
                    onPressed: () {
                      BlocProvider.of<ToDoBloc>(context)
                          .toggleCompletion(object.id);
                    }),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(DetailToDoView.routeName,
                        arguments: object.id);
                    BlocProvider.of<ToDoBloc>(context).getByID(object.id);
                  },
                  child: Column(
                    children: <Widget>[
                      Text(
                        object.title,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(object.deadline),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
