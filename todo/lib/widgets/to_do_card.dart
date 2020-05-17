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
    Widget _showDialog() {
      return AlertDialog(
        title: const Text("Confirm"),
        content: const Text("Are you sure you wish to delete this item?"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("CANCEL"),
          ),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("DELETE")),
        ],
      );
    }

    return Dismissible(
      key: ValueKey(object.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) =>
          BlocProvider.of<ToDoBloc>(context).deleteToDo(object.id),
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return _showDialog();
          },
        );
      },
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
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
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
                      object.isCompleted
                          ? Icons.done_outline
                          : Icons.done_outline,
                    ),
                    onPressed: () {
                      BlocProvider.of<ToDoBloc>(context)
                          .toggleCompletion(object.id);
                    }),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(DetailRoute.routeName, arguments: object.id);
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
                      Text(object.description),
                      object.deadline != null
                          ? Text(
                              DateFormat.yMMMd().format(object.deadline),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          : Text(
                              'No Deadline',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => Navigator.of(context).pushNamed(
                  EditRoute.routeName,
                  arguments: object,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
