import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/routes/all_routes.dart';

import '../models/todo.dart';
import '../bloc/to_do_list_bloc/to_do_list_bloc.dart';

//This widget returns a card that takes ToDo object as argument
class ToDoCard extends StatelessWidget {
  final ToDoModel object;
  ToDoCard(this.object);

  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Confirm Deletion"),
            content: new Text("Are You Sure?"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text("Delete"),
                onPressed: () {
                 BlocProvider.of<ToDoListBloc>(context).deleteToDo(object.id);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    return Dismissible(
      key: ValueKey(object.id),
      direction: DismissDirection.startToEnd,
      onDismissed:(_)=> _showDialog(),
      background: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
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
                      BlocProvider.of<ToDoListBloc>(context)
                          .toggleCompletion(object.id);
                    }),
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(DetailRoute.routeName, arguments: object.id);
                    BlocProvider.of<ToDoListBloc>(context).getByID(object.id);
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
